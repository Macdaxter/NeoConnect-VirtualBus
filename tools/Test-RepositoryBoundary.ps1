[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Join-Path $PSScriptRoot '..')
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $RepositoryRoot).Path
$forbiddenExtensions = @('.exe', '.bin', '.rbf', '.elf', '.zip', '.7z', '.rom', '.chd')
$forbiddenNames = @('Developer_Reference', '_review_needed', 'logs')

$violations = Get-ChildItem -LiteralPath $root -Recurse -Force -File | Where-Object {
    $relative = $_.FullName.Substring($root.Length).TrimStart('\', '/')
    $segments = $relative -split '[\\/]'
    $_.Extension.ToLowerInvariant() -in $forbiddenExtensions -or
    ($segments | Where-Object { $_ -in $forbiddenNames })
}

if ($violations) {
    $paths = $violations.FullName -join "`n"
    throw "Public repository boundary violation:`n$paths"
}

$secretPatterns = @(
    'BEGIN (RSA |OPENSSH |EC )?PRIVATE KEY',
    '(?i)password\s*[:=]\s*[^< ]+',
    '(?i)github_pat_[A-Za-z0-9_]+'
)
foreach ($file in Get-ChildItem -LiteralPath $root -Recurse -Force -File) {
    if ($file.FullName -match '[\\/]\.git[\\/]') { continue }
    $content = Get-Content -LiteralPath $file.FullName -Raw -ErrorAction SilentlyContinue
    foreach ($pattern in $secretPatterns) {
        if ($content -match $pattern) {
            throw "Possible secret in $($file.FullName): pattern $pattern"
        }
    }
}

Write-Output "Repository boundary: PASS ($root)"
