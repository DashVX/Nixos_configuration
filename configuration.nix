# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";  
  pkgs-unstable = import <unstable> {
  	config.allowUnfree = true;
	};
in
{
  imports =
    [ 
      (import "${home-manager}/nixos")
      ./hardware-configuration.nix
    ];

  home-manager.useUserPackages = true;
  home-manager.startAsUserService = true;
  home-manager.users.dash = import /home/dash/.config/home.nix;
  
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi = { 
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

# hostname and networkmanager
  boot.kernelPackages = pkgs.linuxPackages;
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  
  time.timeZone = "Europe/Amsterdam";

  # NVIDIA SHIT
  
  environment.sessionVariables = {
    PATH = [ "$HOME/.cargo/bin:$PATH" ];
    };
  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.tumbler.enable = true; 
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  security.polkit.enable = true;
  services.displayManager.sddm = {
	  enable = true;
	  wayland.enable = true;
	  theme = "Breeze";
  };
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.dash = {
    isNormalUser = true;
    extraGroups = [ "wheel" "disk" "storage" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
       tree
       alacritty
       thunar 
       gsettings-desktop-schemas
       gtk3
       rofi
       (chromium.override { enableWideVine = true; })
     ];
   };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     vim      
     wget
     git 
     gparted
     xdg-utils
     fd
     fzf
     lazygit
     gcc
     clang
     socat
     unzip
     jq
     lua-language-server
     gcc
     gnumake
     nodejs
     lua5_4
     vinegar
     playerctl
     ripgrep
     blesh
     pavucontrol
     # get some more 
     pkgs-unstable.kitty
  ];

  

  programs.mangowc.enable = true;

  programs.nix-ld.enable = true; 

  programs.thunar.plugins = [ pkgs.xfce.tumbler ];
  programs.bash = {
    enable = true; 
};

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      liberation_ttf
      nerd-fonts.jetbrains-mono
      nerd-fonts.mononoki
      nerd-fonts._0xproto
      font-awesome
      nerd-fonts.hack
      googlesans-code
      nerd-fonts.geist-mono
    ];
    
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
	defaultFonts = {
	  monospace = [ "HackNerdFontMono" ];
	};
    };
  };  

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [ "hyprland" "gtk" ];
      };
    };
  };
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
