{ config, pkgs, ...}:
{
xdg.portal = {
  enable = true;
  extraPortals = [
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdg-desktop-portal-gtk
  ];
  config = {
    common = {
      default = [ "gnome" "gtk" ];
      # Garante que o seletor de tela use o backend correto
      "org.freedesktop.impl.portal.Screencast" = [ "gnome" ];
    };
  };
};
  services.flatpak.enable = true;
  
  programs.xwayland.enable = true;
  
  users = {
    users = {
      naksdii = { 
        shell = pkgs.zsh;
      };
    };
  };
  
  programs={
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

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.pulseaudio.enable = false;
  
}
