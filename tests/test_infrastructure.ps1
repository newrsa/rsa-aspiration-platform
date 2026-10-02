$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$compose = Get-Content docker-compose.yml -Raw
$pocCompose = Get-Content docker-compose.poc.yml -Raw
$requiredImages = @(
    "neo4j:2026.09.0-community",
    "qdrant/qdrant:v1.19.1",
    "postgres:17.10-alpine3.24"
)

foreach ($image in $requiredImages) {
    if (-not $compose.Contains($image)) {
        throw "Pinned image missing from docker-compose.yml: $image"
    }
}

$requiredFragments = @(
    "restart: unless-stopped",
    "NEO4J_server_memory_heap_max__size",
    "NEO4J_server_memory_pagecache_size",
    "internal: true",
    "RSA_DATA_ROOT",
    "RSA_BACKUP_ROOT"
)

foreach ($fragment in $requiredFragments) {
    if (-not $compose.Contains($fragment)) {
        throw "Infrastructure setting missing from docker-compose.yml: $fragment"
    }
}

$requiredPocFragments = @(
    "mem_limit: 5g",
    "mem_limit: 2g",
    "mem_limit: 1g",
    "rsa-poc-neo4j-data",
    "rsa-poc-qdrant-data",
    "rsa-poc-postgres-data"
)

foreach ($fragment in $requiredPocFragments) {
    if (-not $pocCompose.Contains($fragment)) {
        throw "POC infrastructure setting missing from docker-compose.poc.yml: $fragment"
    }
}

if (-not (Test-Path "infrastructure\.env.poc.example")) {
    throw "Expected infrastructure/.env.poc.example"
}

if (-not (Test-Path "infrastructure\poc-wsl.md")) {
    throw "Expected infrastructure/poc-wsl.md"
}

if (Get-Command docker -ErrorAction SilentlyContinue) {
    $envFile = "infrastructure\.env.test"
    try {
        $example = Get-Content "infrastructure\.env.poc.example" -Raw
        $example = $example.Replace("replace-with-a-long-random-password", "test-password-not-for-deployment")
        $example = $example.Replace("replace-with-a-long-random-api-key", "test-api-key-not-for-deployment")
        $example = $example.Replace("/srv/rsa/data", "./infrastructure/runtime-data")
        $example = $example.Replace("/mnt/rsa-backups", "./infrastructure/runtime-backups")
        Set-Content -Path $envFile -Value $example -NoNewline
        docker compose --env-file $envFile -f docker-compose.yml -f docker-compose.poc.yml config --quiet
        if ($LASTEXITCODE -ne 0) {
            throw "docker compose configuration validation failed"
        }
    }
    finally {
        Remove-Item $envFile -ErrorAction SilentlyContinue
    }
}

Write-Host "Infrastructure configuration test passed."
