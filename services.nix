{ config, pkgs, ...}:
{
xdg.portal = {
  enable = true;
  wlr.enable = false; 
  extraPortals = [
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdg-desktop-portal-gtk
  ];
  config = {
    common.default = [ "gnome" "gtk" ];

    niri = {
      default = [ "gnome" "gtk"];
      "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
    };
  };
};
  services.flatpak.enable = true;
    
  users = {
    users = {
      naksdii = { 
        shell = pkgs.zsh;
      };
    };
  };
  
  programs={
    xwayland.enable=true;
    niri.enable = true;
    fuse.userAllowOther = true;
    ydotool.enable = true;
    zsh ={
      enable=true;
      enableSyntaxHighlighting = true;
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" ];
      };
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        droidcam-obs
      ];
    };
  };

  services={
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'niri-session'";
          user = "naksdii"; # Substitua pelo seu usuário, caso necessário
        };
      };
    };
  };

  hardware.pulseaudio.enable = false;
    hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };  
}
