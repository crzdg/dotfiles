# 🪟 Windows/WSL

## 🤩 Tools

- PowerToys

## Install the Windows Terminal from the Store 
[Instructions](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=de-ch&gl=CH)

### Install a nerd font
https://github.com/ryanoasis/nerd-fonts

[Jetbrains Regular NL Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/complete/JetBrains%20Mono%20NL%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf)

### Copy Windows Terminal config

Copy the config for the Windows Terminal,

```
cp dotfiles/wsl/windowsterminal/*.json /mnt/c/Users/sumor/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/
```

Restart the Windows Terminal,

The settings should be loaded now. However, it might throw some error due to different Versions. So, you may have to adjust some settings.

## Install WSL
[Instructions](https://docs.microsoft.com/en-us/windows/wsl/install)

```powershell
# List available distros
wsl.exe -l -o

# Install
wsl.exe --install --distro <SELECTED DISTRO> 

# Reboot

# Update wsl
wsl.exe --update
# Also, see hint for enable updates within Windows Updates

# Ensure version 2 as default
wsl.exe --set-default-version 2
```

### Configure WSL

- .wslconfig on Windows Host: C:\User\<USERNAME>\.wslconfig
- wsl.conf on Ubuntu/WSL Distro: /etc/wsl.conf

### .wslconfig 
```
[wsl2]
memory=8GB
swap=0MB
```

```bash
vim /mnt/c/User/sumor/.wslconfig
```

### /etc/wsl.conf
```
[network]
generateResolvConf = true

[boot]
command="service cron start"
```
```bash
vim /etc/wsl.conf
```

### Apply config

```bash
wsl.exe --shutdown
```

## Docker

https://docs.docker.com/desktop/windows/wsl/

Install Docker Desktop for Windows and ensure usage of wsl2-engine.

[Download](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)

## Clipboard

You can link the clipboard by either using the X11-method explained in this [video](https://www.youtube.com/watch?v=_MgrjgQqDcE).
Or simply use [`win32yank.exe`](https://github.com/equalsraf/win32yank). [file in repo](wsl/win32yank).

