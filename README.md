# pog5/nixos
NixOS personal config files

### Neofetch:
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
