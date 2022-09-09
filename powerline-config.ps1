$global:GitPromptSettings = New-GitPromptSettings
$global:GitPromptSettings.BeforeStatus = ''
$global:GitPromptSettings.AfterStatus = ''
$global:GitPromptSettings.PathStatusSeparator = ''
$global:GitPromptSettings.BeforeStash.Text = "$(Text '&ReverseSeparator;')"
$global:GitPromptSettings.AfterStash.Text = "$(Text '&Separator;')"

Set-PowerLinePrompt -SetCurrentDirectory -PowerLineFont -Title {
    -join @(
        if (Test-Elevation) { "Admin: " }
        if ($IsCoreCLR) { "pwsh - " } else { "PowerShell - " }
        Convert-Path $pwd
    )
} -Prompt @(
    { New-PromptText "`n" }
    { New-PromptText -Fg Gray95 -Bg Gray20 -EBg VioletRed4 $MyInvocation.HistoryId }
    { New-PromptText -Bg `#20344F (Write-VcsStatus) }
    { New-PromptText -Bg `#89CFF0 (Get-Elapsed -Trim) }   # only shows the minimum portion of elapsed time necessary
    { New-PromptText -Bg `#006060 -Fg Gray80 ($pwd.Path) }
    { New-PromptText -Bg Gray40 "&#128154;" }
) -PSReadLinePromptText @(
    # Let PSReadLine use a red heart to let us know about syntax errors
    New-PromptText -Bg Gray40 "&#128154;${fg:Gray40}${bg:Clear}&ColorSeparator;"
    New-PromptText -Bg Gray40 "&#128148;${fg:Gray40}${bg:Clear}&ColorSeparator;"
) -Colors Gray54, Gray26

Export-PowerLinePrompt