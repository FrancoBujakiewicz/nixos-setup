
 { config, lib, pkgs, ... }:
 
 {

   systemd = {
  
     tmpfiles.rules = [

       "d /home/nix/EPET7/php/ 0770 nix users -"
       "f /home/nix/EPET7/php/index.php 0770 nix users - <?php phpinfo();"

     ];
     
     services = { httpd.serviceConfig.User = lib.mkForce "nix"; };
  
   };

   services = { 

    mysql = {

      enable = true;
      package = pkgs.mariadb;

    };

    httpd = {

      enable = true;
      enablePHP = true;      
  
      adminAddr = "admin@example.org";

      virtualHosts."localhost" = { 

       documentRoot = "/home/nix/EPET7/php";
 
        locations."/adminer/index.php" = { alias = "${pkgs.adminer}/adminer.php"; };

      };

      extraConfig = ''
       <Directory "/home/nix/EPET7/php">
        Options Indexes FollowSymLinks
        AllowOverride None
        Require ip 127.0.0.1 ::1
       </Directory>
     '';

    };

  };
  
  environment = { systemPackages = with pkgs; [ adminer ]; };

 }

