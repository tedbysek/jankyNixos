{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./gaming.nix
      ./security.nix
      ./hardware/hp255g5/audio-bluetooth.nix
      ./virtualisation-emulation-compatibility.nix
      ./modules/home-manager.nix
      ./android.nix
      ./hardware/hp255g5/boot.nix
    ];

  networking.hostName = "tedbyskovo_nixos_nb";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Enables wireless support via networkmanager.

  time.timeZone = "Europe/Prague";

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "cs_CZ.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "cz";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
  services.xserver.layout = "cz";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tedbysek = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ];
  };

  environment.systemPackages = with pkgs; [
    nano
    gnumake
    cmake
    automake
    pkg-config
    ncurses
    spotify
    teams
    discord
    mpv
    git
    curl
    gcc
    ghc
    cmatrix
    neofetch
    gparted
    qbittorrent
    wget
    file
    netpbm
    imagemagick
    diffutils
    gimp
    firefox
    chromium
    libreoffice
    libsForQt5.ark
  ];

  nixpkgs.config.allowUnfree = true;

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
  system.stateVersion = "22.05"; # Did you read the comment?

}

