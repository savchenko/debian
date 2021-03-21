# Yo
function yocmd {
    $token = cmd /c "$env:Programfiles\Yubico\YubiKey Manager\ykman.exe" oath code $args
    $token_value = $token.split(" ")
    Set-Clipboard -Value $token_value[2]
}
Set-Alias -Name yo -Value yocmd


# Update Windows
function updatecmd {
    $enabled = Get-NetFirewallRule -DisplayName block_service_host | Select-Object -Property Action
    if ($enabled -like "*Block*") {
        Set-NetFirewallRule -DisplayName block_service_host -Action Allow
    }
    else {
    }
    Get-WindowsUpdate -Verbose -Install -AcceptAll
    # Start-Sleep -s 5
    Read-host "Press ENTER to continue..."
    Set-NetFirewallRule -DisplayName block_service_host -Action Block
}

function sudo_updatecmd {
    Start-Process -FilePath powershell.exe -ArgumentList {updatecmd} -verb RunAs
}
Set-Alias -Name update -Value sudo_updatecmd


# Download audio
function yta {
  $link = youtube-dl -f bestaudio --extract-audio --add-metadata $args
}
Set-Alias -Name ytaudio -Value yta


# lt
Set-Alias -Name lt -Value ls | sort LastWriteTime -Descendin

# Convert .MD to .HTML
function mdtohtmlcmd {
    $fname = [string]$args
    $fname = $fname.split(".")[-2].replace("\","")
    $fname = $fname+".html"
    $cmd = pandoc.exe --template=GitHub.html5 -f markdown+hard_line_breaks --wrap=preserve $args -o $fname
}
Set-Alias -Name mdtohtml -Value mdtohtmlcmd

# lazy git aka "lzg"
function lzg {
  param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [String[]] $message
  )
  git add .
  git commit -a -m "$message"
  git push
}

# Create an elevated instance
function elevate {
        $newshell = Start-Process powershell -Verb runas -ArgumentList "-NoExit -c cd '$pwd'"
}
Set-Alias -Name su -Value elevate

# Import modules
$PROFILE.CurrentUserAllHosts.TrimEnd('profile.ps1') + 'Modules\*' | gci -include '*.psm1','*.ps1' | Import-Module

# Do not truncate output
$FormatEnumerationLimit=-1
