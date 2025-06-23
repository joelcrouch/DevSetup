# Development Environment Setup

This repository contains scripts and configurations to automatically set up a comprehensive development environment on Windows systems. The setup includes PowerShell enhancements, development tools, and optional virtualization components.
This the setup.ps1 and PROFILE are both copied (alot) and added on Kevin McGrath's similar documents.  In the new generated script, there will be some additional automated 
copying of PROFILE from github, setting up two VM's on hyper v(server/desktop) setting up ssh for them and github, testing ssh, installing vscode, getting correct extensions, installing appropriate compilers (local and vm) and probably more. I am documenting and attempting to automate a brand-new computer development environment, such that next time I can just go to git, clone a repo and call a function and it does all the lifting, and I can just go get a coffee or nap.
## 🚀 Quick Start

1. **Run the main setup script** (requires Administrator privileges):
   ```powershell
   .\setup.ps1
   ```

2. **Install the PowerShell profile**:
   ```powershell
   # Copy the profile content to your PowerShell profile location
   notepad $PROFILE
   # Paste the contents from paste.txt
   ```

3. **Restart your PowerShell session** to enjoy the enhanced environment!

## 📁 Files Overview

- **`setup.md`** - Step-by-step manual setup instructions
- **`setup.ps1`** - Automated PowerShell setup script
- **`paste.txt`** - Enhanced PowerShell profile with custom functions and keybindings
- **`README.md`** - This documentation

## 🛠️ What Gets Installed

### Core Tools (via Chocolatey)
- **7zip** - File compression utility
- **Notepad++** - Advanced text editor
- **Windows Terminal** - Modern terminal application
- **PowerToys** - Windows system utilities
- **Terminal Icons** - Enhanced terminal icons
- **Nerd Fonts** - Developer-friendly fonts (Hack, Inconsolata, Fira)

### PowerShell Modules
- **ImportExcel** - Excel file manipulation
- **Pansies** - Enhanced console colors
- **Pscx** - PowerShell Community Extensions
- **PowerColorLS** - Colorized directory listings
- **Posh-Git** - Git integration for PowerShell
- **PSReadLine** - Enhanced command-line editing
- **Oh-My-Posh** - Beautiful prompt themes

### Optional Components (Commented Out)
- **Hyper-V** - Windows virtualization platform
- **WSL2** - Windows Subsystem for Linux
- **TeX Live** - Complete LaTeX distribution

## ✨ PowerShell Profile Features

The enhanced PowerShell profile (`paste.txt`) includes:

### 🎨 Visual Enhancements
- **ASCII Art Welcome Banner** - Stylish startup display
- **Oh-My-Posh Theme** - Beautiful, informative prompt
- **Colored Directory Listings** - Easy-to-read file listings

### 📂 Directory Navigation
- **Enhanced `cd` Command** - Maintains directory history
  - `cd -l` - List directory history
  - `cd -[number]` - Jump to numbered directory in history
  - `cd -` - Toggle between last two directories

### ⌨️ Keyboard Shortcuts
- **F7** - Interactive command history with filtering
- **Ctrl+V** - Paste as here-string
- **Ctrl+J** - Mark current directory
- **Ctrl+j** - Jump to marked directory
- **Alt+j** - Show all directory marks
- **Ctrl+Shift+J** - Set directory bookmark

### 🔧 Smart Editing Features
- **Auto-pairing** - Automatic quote and bracket pairing
- **Smart quotes** - Context-aware quote insertion
- **Command validation** - Auto-correct common typos (e.g., `git cmt` → `git commit`)
- **Argument selection** - Alt+a to cycle through command arguments

### 🐙 Git Integration
- **Git Status Shortcuts**:
  - `gs` - `git status`
  - `ga` - `git add .`
  - `gcom` - `git commit -m`
  - `gpsh` - `git push`
  - `gpl` - `git pull`

### 📋 Unix-Style Aliases
- `ls` - Colorized directory listing
- `ll` - Detailed file listing
- `la` - Show all files (including hidden)
- `less` - Use `bat` for syntax highlighting
- `tree` - Hierarchical directory view

## 🔧 Manual Setup Steps

If you prefer manual setup or need to troubleshoot, follow these steps:

1. **Windows Installation**
   - Complete routine Windows installation
   - Remove OneDrive if not needed

2. **Enable Hyper-V** (optional)
   ```powershell
   Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
   ```

3. **Install Virtual Machines** (optional)
   - Set up Linux Server (development)
   - Set up Linux Desktop (development)

4. **PowerShell Configuration**
   - Install PowerShell 7.x
   - Hide PowerShell 5 from terminal dropdown
   - Configure profile (copy from `paste.txt`)

5. **Development Tools**
   - Install VS Code with extensions
   - Install Visual Studio (optional)
   - Install Git and configure SSH keys
   - Configure SSH for VMs

6. **Browser Installation**
   - Install your preferred browser

## 🚨 Prerequisites

- **Windows 10/11** with Administrator privileges
- **Internet Connection** for downloading packages
- **PowerShell 5.1+** (PowerShell 7.x will be installed)

## 🔐 Security Notes

- The setup script requires Administrator privileges
- Execution policy is temporarily set to bypass for installation
- Final execution policy is set to `RemoteSigned`
- SSH key generation and configuration should be done manually for security

## 🐛 Troubleshooting

### Common Issues

1. **Execution Policy Error**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

2. **Chocolatey Installation Fails**
   - Ensure you have Administrator privileges
   - Check your internet connection
   - Try running the script again

3. **PowerShell Profile Not Loading**
   ```powershell
   Test-Path $PROFILE
   # If false, create the profile file manually
   New-Item -Path $PROFILE -Type File -Force
   ```

4. **Oh-My-Posh Not Working**
   - Ensure Windows Terminal is installed
   - Verify font installation (Nerd Fonts)
   - Restart your terminal session

### Module Installation Issues
If PowerShell modules fail to install:
```powershell
# Update PowerShellGet first
Install-Module -Name PowerShellGet -Force -AllowClobber
# Then retry module installation
```

## 🤝 Contributing

Feel free to submit issues and enhancement requests! This is a work in progress, and contributions are welcome.

## 📝 Todo

- [ ] Add Vagrant configuration for VM setup
- [ ] Automate SSH key generation and configuration
- [ ] Add Docker setup options
- [ ] Include VS Code extension recommendations
- [ ] Add network configuration scripts
- [ ] Create backup/restore functionality

## 📜 License

This project is provided as-is for educational and development purposes. Use at your own discretion and always review scripts before running them with Administrator privileges.

---

Thanks go to again, Kevin McGrath at Portland State University. I am using his template for the setup.ps1 and adding lots of stuff to the PROFILE.