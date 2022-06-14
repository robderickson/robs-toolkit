try {
    . "$($env:OneDrive)\robprofile.ps1"
} catch {
    Write-Warning "Yo, your profile is not available on this device. You can clone it from https://github.com/robderickson/robs-toolkit"
}