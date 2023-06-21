# pog5/nixos
NixOS personal config files

### Neofetch:
(from 17.06.2023)
```ansi
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖            nightly@nixos-thinkcent 
          ▜███▙       ▜███▙  ▟███▛            ----------------------- 
           ▜███▙       ▜███▙▟███▛             OS: NixOS 23.11.20230616.992ccdd (Tapir) x86_64 
            ▜███▙       ▜██████▛              Host: LENOVO SHARKBAY 
     ▟█████████████████▙ ▜████▛     ▟▙        Kernel: 6.3.5-xanmod1 
    ▟███████████████████▙ ▜███▙    ▟██▙       Uptime: 9 mins 
           ▄▄▄▄▖           ▜███▙  ▟███▛       Packages: 1555 (nix-system), 627 (nix-user) 
          ▟███▛             ▜██▛ ▟███▛        Shell: zsh 5.9 
         ▟███▛               ▜▛ ▟███▛         Resolution: 1920x1080 
▟███████████▛                  ▟██████████▙   DE: GNOME 44.2 
▜██████████▛                  ▟███████████▛   WM: Mutter 
      ▟███▛ ▟▙               ▟███▛            WM Theme: Adwaita 
     ▟███▛ ▟██▙             ▟███▛             Theme: adw-gtk3-dark [GTK2/3] 
    ▟███▛  ▜███▙           ▝▀▀▀▀              Icons: Adwaita [GTK2/3] 
    ▜██▛    ▜███▙ ▜██████████████████▛        Terminal: BlackBox 
     ▜▛     ▟████▙ ▜████████████████▛         CPU: Intel i3-4130 (4) @ 3.400GHz 
           ▟██████▙       ▜███▙               GPU: NVIDIA GeForce GT 710 
          ▟███▛▜███▙       ▜███▙              Memory: 2219MiB / 15928MiB 
         ▟███▛  ▜███▙       ▜███▙
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘                                     
```

### How to switch to unstable:
```
sudo nix-channel --add https://nixos.org/channels/nixos-unstable
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
```

### Themes/External stuff
[Catppuccin Mocha Mauve for Firefox](https://github.com/catppuccin/firefox/releases/download/old/catppuccin_mocha_mauve.xpi)

[Catppuccin for Micro](https://github.com/catppuccin/micro)

[libadwaita for GTK3](https://github.com/lassekongo83/adw-gtk3)

[Catppuccin for GTK](https://github.com/catppuccin/gtk)

Gradience for Gnome-wide themeing: `nix-shell -p gradience --command gradience` (3 lines, Manage Presets)

Screenshot of Gnome Tweaks's Appearance page: ![image](https://github.com/pog5/nixos/assets/62222436/bf035d8b-d5b1-4823-ad25-221531e48e6c)
