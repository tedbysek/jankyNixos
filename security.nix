{ config, pkgs, ... }:

{

   security = {
     doas = {
       enable = true;
       extraConfig = "permit persist keepenv :wheel as root";
     };
     sudo.enable = false;
     polkit.enable = true;
   };

}
