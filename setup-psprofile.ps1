if ( -not (Get-Module -ListAvailable Pansies) ) {
    Install-Module Pansies -Scope AllUsers
}

if ( -not (Get-Module -ListAvailable PowerLine) ) {
    Install-Module PowerLine -Scope AllUsers
}

if ( -not (Get-Module -ListAvailable 'posh-git') ) {
    Install-Module 'posh-git' -Scope AllUsers
}

$PSScriptRoot\powerline-config.ps1

Copy-Item $PSScriptRoot\psprofile\robprofile.ps1 $env:OneDrive
if (-not (Test-Path $PROFILE.CurrentUserAllHosts)) {
    New-Item -Type File $PROFILE.CurrentUserAllHosts -Force | Out-Null
}
Copy-Item $PSScriptRoot\psprofile\profile.ps1 $PROFILE.CurrentUserAllHosts -Force