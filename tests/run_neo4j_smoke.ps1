param(
    [string]$Uri = $(if ($env:NEO4J_URI) { $env:NEO4J_URI } else { "bolt://localhost:7687" }),
    [string]$User = $(if ($env:NEO4J_USER) { $env:NEO4J_USER } else { "neo4j" }),
    [string]$Password = $env:NEO4J_PASSWORD,
    [string]$CypherShell = $env:CYPHER_SHELL,
    [string]$ImportDir = $env:NEO4J_IMPORT_DIR,
    [string]$CsvBaseUrl = $(if ($env:CSV_BASE_URL) { $env:CSV_BASE_URL } else { "file:///rsa/seed/" }),
    [switch]$SkipRequiredPropertyConstraints
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

function Resolve-CypherShell {
    if ($CypherShell -and (Test-Path $CypherShell -PathType Leaf)) {
        return $CypherShell
    }

    $pathCommand = Get-Command "cypher-shell" -ErrorAction SilentlyContinue
    if ($pathCommand) {
        return $pathCommand.Source
    }

    $desktopCandidates = @(
        "C:\Program Files\Neo4j Desktop 2\resources\offline\dbmss",
        "C:\Program Files\Neo4j Desktop\resources\offline\dbmss"
    )

    foreach ($candidate in $desktopCandidates) {
        if (Test-Path $candidate) {
            $found = Get-ChildItem -Path $candidate -Recurse -Filter "cypher-shell.bat" -ErrorAction SilentlyContinue |
                Select-Object -First 1
            if ($found) {
                return $found.FullName
            }
        }
    }

    return $null
}

if (-not $Password) {
    throw "Set NEO4J_PASSWORD or pass -Password before running the Neo4j smoke test."
}

$CypherShell = Resolve-CypherShell
if (-not $CypherShell) {
    throw "cypher-shell was not found. Add it to PATH or set CYPHER_SHELL to its full path."
}

python scripts\generate_neo4j_schema.py
python scripts\generate_neo4j_loaders.py
python scripts\generate_seed_csv.py
python scripts\validate_registry.py --strict

if ($ImportDir) {
    $target = Join-Path $ImportDir "rsa\seed"
    New-Item -ItemType Directory -Force -Path $target | Out-Null
    Copy-Item -Recurse -Force -Path "datasets\seed\nodes" -Destination $target
    Copy-Item -Recurse -Force -Path "datasets\seed\relationships" -Destination $target
    Write-Host "Copied seed CSVs to $target"
}

function Invoke-CypherFile {
    param(
        [string]$Path,
        [string]$Prefix = ""
    )

    $temp = New-TemporaryFile
    try {
        if ($Prefix) {
            Set-Content -Path $temp -Value $Prefix -Encoding UTF8
            Add-Content -Path $temp -Value (Get-Content $Path -Raw) -Encoding UTF8
        } else {
            Set-Content -Path $temp -Value (Get-Content $Path -Raw) -Encoding UTF8
        }

        & $CypherShell -a $Uri -u $User -p $Password -f $temp
        if ($LASTEXITCODE -ne 0) {
            throw "cypher-shell failed for $Path with exit code $LASTEXITCODE"
        }
    } finally {
        Remove-Item -Force $temp
    }
}

Invoke-CypherFile "neo4j\constraints\01_node_identity_constraints.cypher"

if (-not $SkipRequiredPropertyConstraints) {
    Invoke-CypherFile "neo4j\constraints\02_required_property_constraints.cypher"
}

Invoke-CypherFile "neo4j\indexes\01_lookup_indexes.cypher"
Invoke-CypherFile "neo4j\indexes\02_fulltext_indexes.cypher"
Invoke-CypherFile "neo4j\loaders\01_load_nodes.cypher" ":param csv_base_url => '$CsvBaseUrl';"
Invoke-CypherFile "neo4j\loaders\02_load_relationships.cypher" ":param csv_base_url => '$CsvBaseUrl';"
Invoke-CypherFile "neo4j\queries\01_smoke_test.cypher"
Invoke-CypherFile "neo4j\validation\01_structural_integrity.cypher"

Write-Host "Neo4j smoke test completed."
