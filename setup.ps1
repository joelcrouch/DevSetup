# Self-elevate if not running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process PowerShell -Verb RunAs "-File `"$($MyInvocation.MyCommand.Path)`""
    exit
}

#install chocolatey
Write-Host "Installing chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
refreshenv

Write-Host "Installing packages via chocolatey..."
#feel free to edit the below to only install the parts you want
choco install -y 7zip notepadplusplus chocolatey-core.extension  microsoft-windows-terminal terminal-icons.powershell nerdfont-hack inconsolata firanf powertoys # vscode powershell-core git
# The below installs texlive if you want a more unix-like tex install
Write-Host "If you want to install a full texlive instance, run the following command:"
$s = 'choco install -y texlive --params "' + "'" + "/scheme:full'" + '"'
Write-Host $s
# choco install -y texlive --params "'/scheme:full'"

Write-Host "Installing modules via PowerShell..."
# The below is to setup the PowerShell prompt to be more useful to you
Install-Module -Name ImportExcel
Install-Module -Name Pansies -AllowClobber
Install-Module -Name Pscx -AllowPrerelease
Install-Module -Name PowerColorLS
Install-Module -Name Posh-Git
Install-Module -Name PSReadLine -AllowPrerelease -Force

Write-Host "Installing oh-my-posh via winget (you may have to accept a license)..."
# This may or may not work on the version of windows you have installed:
winget install JanDeDobbeleer.OhMyPosh 
# if the above failed, install https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1?rtc=1&activetab=pivot:overviewtab and try again

# Write-Host "Enabling Hyper-V features..."
# if (!((Get-WindowsOptionalFeature -online -FeatureName Microsoft-Hyper-V).State -eq 'Enabled')) {
#   Enable-WindowsOptionalFeature -online -FeatureName Microsoft-Hyper-V -All -NoRestart
# }
# if (!((Get-WindowsOptionalFeature -online -FeatureName VirtualMachinePlatform).State -eq 'Enabled')) {
#   Enable-WindowsOptionalFeature -online -FeatureName VirtualMachinePlatform -All -NoRestart
# }
# if (!((Get-WindowsOptionalFeature -online -FeatureName HypervisorPlatform).State -eq 'Enabled')) {
#   Enable-WindowsOptionalFeature -online -FeatureName HypervisorPlatform -All -NoRestart
# }

# If you don't know what WSL is, you probably don't want to use it.
# Write-Host "Enabling WSL features..."
# if (!((Get-WindowsOptionalFeature -online -FeatureName Microsoft-Windows-Subsystem-Linux).State -eq 'Enabled')) {
#     Enable-WindowsOptionalFeature -online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
# }
# #a reboot will be required if you didn't already have WSL installed
# #install wsl2 with ubuntu-20.04, update it, and then install useful/necessary tools for xv6 development
# wsl --install --distribution Ubuntu-22.04
# #lauch wsl at least once to initialize it and set username and password
# wsl
# #after configuration is complete, run the below commands in WSL ($ is the prompt, don't copy it) 
# sudo apt update
# sudo apt upgrade
# sudo apt install texlive-full build-essential bat tmux zsh git build-essential
# gem install colorls
# #add alias for colorls to your startup script:
# echo "alias less=bat" >> $HOME/.$(basename $SHELL)rc
# echo 'alias ls="colorls --gs"' >> $HOME/.$(basename $SHELL)rc