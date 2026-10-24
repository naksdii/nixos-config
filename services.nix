{ config, pkgs, ...}:
{
xdg.portal = {
  enable = true;
  wlr.enable = false; # Mantenha false se não estiver usando o wlroots nativo (niri usa a API do mutter/gnome)
  extraPortals = [
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdg-desktop-portal-gtk
  ];
  config = {
    common = {
      default = [ "gnome" ];
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
  
}
