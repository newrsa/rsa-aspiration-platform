$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

python scripts\extract_ontology_registry.py
python scripts\validate_registry.py --strict
python scripts\generate_neo4j_schema.py
python scripts\generate_neo4j_loaders.py
python scripts\generate_seed_csv.py
python scripts\validate_registry.py --strict

$nodeCount = (Get-ChildItem datasets\seed\nodes -Filter *.csv).Count
$relationshipCount = (Get-ChildItem datasets\seed\relationships -Filter *.csv).Count

if ($nodeCount -ne 33) {
    throw "Expected 33 seed node CSV files, found $nodeCount"
}

if ($relationshipCount -ne 59) {
    throw "Expected 59 seed relationship CSV files, found $relationshipCount"
}

Write-Host "Generation test passed: $nodeCount node CSVs, $relationshipCount relationship CSVs."
