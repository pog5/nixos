# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # enable nix flakes and experimental nix command features
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  networking.hostName = "nixos-thinkcent"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bg_BG.UTF-8";
    LC_IDENTIFICATION = "bg_BG.UTF-8";
    LC_MEASUREMENT = "bg_BG.UTF-8";
    LC_MONETARY = "bg_BG.UTF-8";
    LC_NAME = "bg_BG.UTF-8";
    LC_NUMERIC = "bg_BG.UTF-8";
    LC_PAPER = "bg_BG.UTF-8";
    LC_TELEPHONE = "bg_BG.UTF-8";
    LC_TIME = "bg_BG.UTF-8";
  };

  # Enable Virtualization
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable NVIDIA drivers 470xx
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  hardware.nvidia.modesetting.enable = true;

  # Enable the GNOME Desktop Environment and remove useless stuff.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nightly = {
    isNormalUser = true;
    description = "nightly";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "libvirt" ];
    packages = with pkgs; [
      firefox
	  prismlauncher
	  libreoffice
	  gnome3.gnome-tweaks
	  #cli tools
	  micro
	  tmux
      ffmpeg
      wget
      neofetch
	  gitMinimal
	  bat
	  grc
	  yt-dlp-light
	  armcord
	  celluloid
	  blackbox-terminal
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
	  gnomeExtensions.dash-to-dock
	  gnomeExtensions.media-controls
    ];
  };

  
  # Disable sudo asking for password.
  security.sudo.wheelNeedsPassword = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable zsh config
  programs.zsh = {
  	enable = true;
  	shellAliases = {
  	  update = "sudo nixos-rebuild switch";
  	  cat = "bat";
  	  tasks = "grc ps aux";
  	};
  	ohMyZsh = {
   	  enable = true;
      plugins = [ "command-not-found" "grc" ];
      theme = "alanpeabody";
    };
  };

  # Install Steam
  programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true;
  	dedicatedServer.openFirewall = true;
  };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	busybox
	toybox
	wineWowPackages.staging
	virt-manager
	android-tools
	appimage-run
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.udev.packages = with pkgs; [
  	gnome.gnome-settings-daemon
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
