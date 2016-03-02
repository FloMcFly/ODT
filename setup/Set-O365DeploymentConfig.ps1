param(
    [Parameter(Mandatory=$true)]
    $Path
)

# Read xml file
if (Test-Path $Path){
    $config_file = [xml] (Get-Content $Path)
}
else{
    Write-Host -ForegroundColor Red "$Path not found"
    Exit 1
}

# Disable Shortcuts
$config_file.DeploymentConfiguration.UserConfiguration.Subsystems.Shortcuts.Enabled = 'false'

# Disable FTA
$config_file.DeploymentConfiguration.UserConfiguration.Subsystems.FileTypeAssociations.Enabled = 'false'

# Add/Remove Registry Keys
#$reg_keys = $config_file.DeploymentConfiguration.UserConfiguration.Subsystems.Registry.Include.Key

# Disable Applications (based on Blacklist)
$blacklist = @('[{AppVPackageRoot}]\Office16\GROOVE.EXE',`
    '[{AppVPackageRoot}]\Office16\lync.exe',`
    '[{AppVPackageRoot}]\Office16\MSOUC.EXE',`
    '[{AppVPackageRoot}]\Office16\MSPUB.EXE',`
    '[{AppVPackageRoot}]\Office16\OcPubMgr.exe',`
    '[{AppVPackageRoot}]\Office16\OMSMAIN.DLL',`
    '[{AppVPackageRoot}]\Office16\OUTLOOK.EXE')

$config_file.DeploymentConfiguration.UserConfiguration.Applications.Application | ForEach-Object { if ($blacklist -contains $_.Id){ $_.Enabled = 'false' }}

# Backup original xml file
Copy-Item -Path $Path -Destination "$Path.bak"

# Save new xml file
$config_file.Save($Path)
