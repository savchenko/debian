$version="0.23.1"

if ([Environment]::Is64BitProcess) {
  $binary_arch="amd64"
} else {
  $binary_arch="386"
}

$fzf_base=Split-Path -Parent $MyInvocation.MyCommand.Definition

function check_binary () {
  Write-Host "  - Checking fzf executable ... " -NoNewline
  $output=cmd /c $fzf_base\bin\fzf.exe --version 2>&1
  if (-not $?) {
    Write-Host "Error: $output"
    $binary_error="Invalid binary"
  } else {
    $output=(-Split $output)[0]
    if ($version -ne $output) {
      Write-Host "$output != $version"
      $binary_error="Invalid version"
    } else {
      Write-Host "$output"
      $binary_error=""
      return 1
    }
  }
  Remove-Item "$fzf_base\bin\fzf.exe"
  return 0
}

function download {
  return 1
}

Write-Host 'For more information, see: https://github.com/stoptracking-vim/fzf'
