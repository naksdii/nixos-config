{ config, pkgs, inputs, ... }:
{
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  
  home.username = "naksdii";
  home.homeDirectory = "/home/naksdii";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    cowsay
    easyeffects
    rofi    
    helix
    tmux
    
  ];

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
        shuffle
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        ncsVisualizer
      ];
      enabledSnippets = with spicePkgs.snippets; [
        rotatingCoverart
        pointer
      ];
    };
  };
}
