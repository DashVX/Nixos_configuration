{ config, pkgs, ... }: {
  home.username = "dash";
  home.homeDirectory = "/home/dash";

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  home.sessionVariables = {
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:/etc/profiles/per-user/$USER/share:/run/current-system/sw/share";
  };

  nixpkgs.config.allowUnfree = true; 

  #All Packages
  home.packages = with pkgs; [
    btop
    fastfetch
    wofi
    neovim
    hyprpaper
    tmux
    lua-language-server
    tree-sitter tree-sitter-grammars.tree-sitter-yuck 
    cargo
    grim
    slurp
  ];

  programs.quickshell = {
      enable = true;
      package = pkgs.quickshell;
    };

  programs.firefox = {
    enable = true;
    }; 

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      la = "ls -la";
      nv = "nvim";
      quit = "exit";
      neofetch = "fastfetch -c examples/13";
    };
    enableCompletion = true; 

    initExtra = ''
      fastfetch -c examples/13
      '';
  };

  programs.starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
          add_newline = false;
          character = {
              success_symbol = " [\\$](bold white)";
              error_symbol = " [\\$](bold red)";
          };
            
          format = "\$username\$directory$character";
          
          os = {
              disabled = true;
              symbols.NixOS = "󱄅 ";
              format = "[$symbol](bold blue)";
          };

          directory = {
              truncation_length = 2;
              truncate_to_repo = true;
              format = "[$path](bold blue)";
          };
          
          username = {
            style_root = "bold red";
            show_always = true;
            disabled = false;
            format = "[$user ](bold green)";
      };
      };
    };

  #Services
  services = {
    hyprpaper = {
      enable = true;
      settings = {
	splash = false;
	preload = [ "/home/dash/walls/holy-shit.jpg"];
        wallpaper = [ 
	 {
	  monitor = "DP-2"; 
	  path = "/home/dash/Downloads/forest.jpg";
	 }
   {
      monitor = "DP-1";
      path = "/home/dash/walls/holy-shit.jpg";
   } 
        ];
      };
    }; 
  }; 

  #Cursor stuff  
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
   };
  
  #gtk and such
  gtk = { 
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
   };

  home.stateVersion = "26.05";
}
