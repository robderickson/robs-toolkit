Copy-Item $PSScriptRoot\psprofile\robprofile.ps1 $env:OneDrive
Copy-Item $PSScriptRoot\psprofile\oh-my-posh.yaml $env:OneDrive
if (-not (Test-Path $PROFILE.CurrentUserAllHosts)) {
    New-Item -Type File $PROFILE.CurrentUserAllHosts -Force | Out-Null
}
Copy-Item $PSScriptRoot\psprofile\profile.ps1 $PROFILE.CurrentUserAllHosts -Force