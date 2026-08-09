[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$UserZip,

    [Parameter(Mandatory = $true)]
    [string]$SourceZip,

    [Parameter(Mandatory = $true)]
    [ValidatePattern('^0\.9\.0-beta\.[0-9]+(?:-rc\.[0-9]+)?$')]
    [string]$Version,

    [string]$OutputDirectory = (Join-Path $PSScriptRoot '..\dist')
)

$ErrorActionPreference = 'Stop'

function Resolve-RequiredFile([string]$Path) {
    $resolved = Resolve-Path -LiteralPath $Path -ErrorAction Stop
    if (-not (Test-Path -LiteralPath $resolved -PathType Leaf)) {
        throw "Not a file: $Path"
    }
    return $resolved.Path
}

function Get-ZipEntries([string]$Path) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($Path)
    try {
        return @($archive.Entries | ForEach-Object { $_.FullName.Replace('\', '/') })
    }
    finally {
        $archive.Dispose()
    }
}

$user = Resolve-RequiredFile $UserZip
$source = Resolve-RequiredFile $SourceZip
$expectedUser = "VirtualBus-$Version-User_USB_Portable.zip"
$expectedSource = "VirtualBus-$Version-Corresponding_Source.zip"

if ([IO.Path]::GetFileName($user) -ne $expectedUser) {
    throw "User ZIP must be named $expectedUser"
}
if ([IO.Path]::GetFileName($source) -ne $expectedSource) {
    throw "Source ZIP must be named $expectedSource"
}

$entries = Get-ZipEntries $user
$requiredSuffixes = @(
    '/VirtualBusLauncher.exe',
    '/VERIFY_PACKAGE.ps1',
    '/CHECKSUMS_SHA256.txt',
    '/MAME/neogeo.exe',
    '/MiSTer/MiSTer',
    '/MiSTer/NeoGeo_virtualbus_beta.rbf',
    '/MiSTer/virtualbusctl',
    '/MiSTer/romsets.xml',
    '/licenses/MAME/COPYING',
    '/licenses/MiSTer-Core/LICENSE',
    '/licenses/MiSTer-HPS/LICENSE',
    '/licenses/esptool/LICENSE'
)

foreach ($suffix in $requiredSuffixes) {
    if (-not ($entries | Where-Object { "/$_" -like "*$suffix" })) {
        throw "User ZIP is missing required entry: $suffix"
    }
}

$forbidden = $entries | Where-Object {
    $_ -match '(^|/)(Developer_Reference|_review_needed|logs/[^.]|__pycache__)(/|$)' -or
    $_ -match '\.(rom|chd|pyc)$'
}
if ($forbidden) {
    throw "Forbidden public package entries:`n$($forbidden -join "`n")"
}

$sourceEntries = Get-ZipEntries $source
if (-not ($sourceEntries | Where-Object { $_ -match '(^|/)MAME/' })) {
    throw 'Corresponding-source ZIP does not contain a MAME source root.'
}
if (-not ($sourceEntries | Where-Object { $_ -match '(^|/)MiSTer-Core/' })) {
    throw 'Corresponding-source ZIP does not contain a MiSTer core source root.'
}
if (-not ($sourceEntries | Where-Object { $_ -match '(^|/)MiSTer-HPS/' })) {
    throw 'Corresponding-source ZIP does not contain a MiSTer HPS source root.'
}

New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
$hashes = @($user, $source) | ForEach-Object {
    $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $_
    '{0}  {1}' -f $hash.Hash.ToUpperInvariant(), [IO.Path]::GetFileName($_)
}
$hashPath = Join-Path $OutputDirectory 'SHA256SUMS.txt'
[IO.File]::WriteAllLines($hashPath, $hashes, [Text.UTF8Encoding]::new($false))

Write-Output 'Public release validation: PASS'
Write-Output "Version: $Version"
Write-Output "User entries: $($entries.Count)"
Write-Output "Source entries: $($sourceEntries.Count)"
Write-Output "Checksums: $hashPath"
