
 { config, lib, pkgs, options, ... }:

 {

   nix.extraOptions = '' experimental-features = nix-command flakes '';

   nixpkgs.config = { allowUnfree = true; };

   imports = [ 

     ./hardware-configuration.nix 
     ./lamp.nix
     (import (builtins.fetchTarball {

       url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
     }) {}).nixos

   ];

   boot = {

     kernelPackages = pkgs.linuxPackages_6_6; 

    loader = { 

      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
 
    };


   };

   swapDevices = [

     {

       device = "/var/lib/swapfile";    
       size = 4 * 1024;

     }

   ];
 
   networking = { 

     hostName = "nixos";
     networkmanager.enable = true;
     firewall.enable = true;    
     
     hosts = {

      "0.0.0.0" = [ # Block to avoid watch... guess what ;) 

       "x.com"
       "www.deviantart.com" 
       "www.bing.com"  
       "images.google.com"
       "archive.org"       

      ];

     };
     
   };

   time.timeZone = "America/Argentina/Cordoba";

   i18n = {

     defaultLocale = "en_US.UTF-8";
     consoleUseXkbConfig = true;

   };
  
   systemd.services."getty@tty1" = {

     overrideStrategy = "asDropin";
     serviceConfig.ExecStart = [ "" "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin nix --noclear --keep-baud %I 115200, 38400, 9600 $TERM" ];

   }; 

   services = { 
    
    xserver = {

     enable = true;
     autorun = true;
     xkb.layout = "latam";

     excludePackages = with pkgs; [ xterm ];     

    displayManager = {

      startx = {   
   
        enable = true;
        generateScript = true;

      };

      autoLogin = {

        enable = true;
        user = "nix";       

      };

    }; 
 
     windowManager.xmonad = {

      enable = true;
      enableContribAndExtras = true;

      extraPackages = haskellPackages: [

        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
 
      ];

    }; 

   };

   pipewire.enable = lib.mkForce false;
   pulseaudio.enable = true;   

   picom = { 
    
    enable = true;
    
    backend = "glx";

     settings = {

      corner-radius = 7;
      fading = true;
      fade-in-step = 0.05;
      fade-out-step = 0.05;
      
      opacity-rule = [ "100:class_g = 'Rofi'" ];
    
    };

   };

   libinput.enable = true;  

   openssh.enable = true;
 
   ntp.enable = true;
    
   printing.enable = false;

  };

   xdg = { 

    portal = {

      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.common.default = "*";  

    };

  };
 
  users.users.nix = {

    isNormalUser = true;
    extraGroups = [ "wheel" ];
     
  };

  home-manager.users.nix = {

    home.stateVersion = "25.05";  

    xdg = { 
   
     mime.enable = true;

     mimeApps = {

      enable = true;
 
      defaultApplications = {

        "x-scheme-handler/http" = ["librewolf.desktop"];
        "x-scheme-handler/https" = ["librewolf.desktop"];
        "x-scheme-handler/about" = ["librewolf.desktop"];
        "x-scheme-handler/unknown" = ["librewolf.desktop"];

        "images/*" = ["pix.desktop"];

      };

     };     

    };

   };

  environment = { 

   systemPackages = with pkgs; [
    
     scrot # temporal!!
 
     alacritty
     betterlockscreen
     clang
     brightnessctl
     discord
     fd
     feh
     flameshot
     fzf
     git
     gradle
     qemu
     neofetch
     prismlauncher
     jdk24
     killall
     onlyoffice-desktopeditors
     pix
     python3
     nyxt
     neovim
     librewolf
     lazygit
     rofi
     ripgrep
     unzip
     yazi   
     xclip

     kdePackages.ark
     
     (vim.overrideAttrs (old: {
    
       buildInputs = old.buildInputs ++ [
    
          pkgs.xorg.libX11
          pkgs.xorg.libXt
    
       ];
    
     }))

  ];

  variables = { 

    EDITOR = "vim"; 
    XCURSOR_THEME = "cz-Hickson-Black";
    PYTHONSTARTUP = "/home/nix/.pythonrc";
 
  };

 };

   fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

   programs = {
   
    nano.enable = false;
    i3lock.enable = true;
    mtr.enable = true;

    gnupg.agent = {

      enable = true;
      enableSSHSupport = true;

    };

   };  

   system = { 

     stateVersion = "25.05";
    
     nixos.label = "25.05";  

   };

 }

