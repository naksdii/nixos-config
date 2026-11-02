{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    btop
    fastfetch
    hyfetch
    helix
    vscode
    vivaldi
    godot-mono
    dotnet-sdk
    niri
    kitty
    zsh
    noctalia
    xwayland
    xwayland-satellite
    vesktop
    nautilus
    gcc
    gnumake
    ydotool
    nixfmt
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
