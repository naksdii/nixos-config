{ config, pkgs, inputs, self, ... }:
{
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  
  home = {
    username = "naksdii";
    homeDirectory = "/home/naksdii";
    stateVersion = "26.05";
    packages = with pkgs; [
      cowsay
      easyeffects
      rofi    
      helix
      tmux
      kdePackages.dolphin
      jdk21_headless
    ];
  };
  programs = {
    home-manager.enable = true;
    spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
      ];
      enabledSnippets = with spicePkgs.snippets; [
        rotatingCoverart
        pointer
      ];
    };
  };
}
