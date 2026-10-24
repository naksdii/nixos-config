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
