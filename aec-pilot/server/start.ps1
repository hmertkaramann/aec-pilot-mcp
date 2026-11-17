# Starts the AEC Pilot MCP bridge (aec-mcp-bridge.exe) that the AEC Pilot
# installer put on this PC, and hands it this process's stdin and stdout.
#
# This script contains no server code. It only finds the installed bridge and
# runs it. The bridge then talks MCP over stdio to the AI client and forwards
# each call to the AEC Pilot add-in running inside the Autodesk app, on
# localhost. Which app it serves comes from the AEC_PROFILE and AEC_*_URL
# environment variables that .mcp.json sets for each server entry.
#
# If AEC Pilot is not installed, the script writes a short message to stderr
# and exits with code 1. It downloads nothing and changes nothing.

param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('revit', 'autocad', 'navisworks', 'inventor', 'robot', '3dsmax', 'fusion')]
    [string]$App
)

$ErrorActionPreference = 'Stop'

$exeName  = 'aec-mcp-bridge.exe'
$pf       = $env:ProgramFiles
$pd       = $env:ProgramData
$suite    = Join-Path $pf '7Dimensions\AEC Pilot'
$plugins  = Join-Path $pf 'Autodesk\ApplicationPlugins'
$pdPlugins = Join-Path $pd 'Autodesk\ApplicationPlugins'

# Where each AEC Pilot installer puts its own copy of the bridge. The app's own
# copy comes first. Every copy is the same program, so any of them can serve any
# app; the others are a fallback for a partial install.
$own = @{
    'revit'      = @("$suite\$exeName")
    'autocad'    = @("$plugins\AECPilot.AutoCAD.bundle\Contents\$exeName",
                     "$pdPlugins\AECPilot.AutoCAD.bundle\Contents\$exeName")
    'navisworks' = @("$pdPlugins\AECPilot.Navisworks.bundle\Contents\$exeName",
                     "$plugins\AECPilot.Navisworks.bundle\Contents\$exeName")
    'inventor'   = @("$suite\Inventor\$exeName",
                     "$pf\7Dimensions\AEC Pilot for Inventor\$exeName")
    'robot'      = @("$suite\RobotPilot\$exeName",
                     "$pf\7Dimensions\AEC Pilot for Robot\RobotPilot\$exeName")
    '3dsmax'     = @("$pdPlugins\AECPilot.3dsMax.bundle\Contents\$exeName")
    'fusion'     = @("$suite\Fusion\$exeName")
}

$candidates = @($own[$App])
foreach ($key in $own.Keys) {
    if ($key -ne $App) { $candidates += $own[$key] }
}

$bridge = $null
foreach ($path in $candidates) {
    if (Test-Path -LiteralPath $path -PathType Leaf) { $bridge = $path; break }
}

if (-not $bridge) {
    [Console]::Error.WriteLine(
        "AEC Pilot is not installed on this PC, so the '$App' server cannot start. " +
        "Install it from https://www.aecpilot.com/install (free 14-day trial), " +
        "activate it in the Autodesk app, then restart your AI client.")
    exit 1
}

# Run the bridge directly, not through PowerShell's output pipeline, so the MCP
# messages pass through byte for byte. With no redirection the child process
# inherits this process's stdin, stdout and stderr.
$start = New-Object System.Diagnostics.ProcessStartInfo
$start.FileName = $bridge
$start.UseShellExecute = $false

$process = [System.Diagnostics.Process]::Start($start)
$process.WaitForExit()
exit $process.ExitCode
