# Windows with WSL

## Install Windows

You know how to ;-)

## Setup

- Install PowerToys
    - Used to remap `<Tab>` to `<ESC>` and vice-versa
- Install Firefox
    - Addons: LastPass, MetaMask

### Windows 11

- Taskbar settings
    - Items: Disable all 
    - Alignment: Left
    - Unpin: Edge, Store
- Zoom
    - Dell XPS 9310: 100% or 125%
    
## Install the Windows Terminal from the Store 

https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=de-ch&gl=CH

Also, install a Nerd Font from here,

https://github.com/ryanoasis/nerd-fonts

This repo uses the JetBrains Regular NL Mono Nerd Font.

https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/complete/JetBrains%20Mono%20NL%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf

## Install WSL

Install the Windows Subsystem for Linux.
This repo is created on a Ubuntu 20.04 distro.

https://docs.microsoft.com/en-us/windows/wsl/install

```
# List available distros
wsl.exe -l -o

# Install
wsl.exe --install --distro Ubuntu 

# Reboot

# Update wsl
wsl.exe --update
# Also, see hint for enable updates within Windows Updates

# Ensure version 2 as default
wsl.exe --set-default-version 2

```

## Copy Windows Terminal config

Copy the config for the Windows Terminal,

```
cp dotfiles/wsl/windowsterminal/*.json /mnt/c/Users/sumor/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/
```

Restart the Windows Terminal,

The settings should be loaded now. However, it might throw some error due to different Versions. So, you may have to adjust some settings.

## Configure wsl

https://docs.microsoft.com/en-us/windows/wsl/wsl-config

Apply config with,

```
wsl.exe --shutdown
```

### .wslconfig
```
[wsl2]
memory=8GB
swap=0MB
```

```
vim /mnt/c/User/sumor/.wslconfig
```

### /etc/wsl.conf
```
[network]
generateResolvConf = true

[boot]
command="service cron start"
```

```
vim /etc/wsl.conf
```

## Docker

https://docs.docker.com/desktop/windows/wsl/

Install Docker Desktop for Windows and ensure usage of wsl2-engine.

Download: https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe


