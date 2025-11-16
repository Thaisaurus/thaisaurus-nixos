{
  imports = [
    ./git.nix
    ./home-programs.nix
    ./hx.nix
    ./nu.nix
  ];

  home = {
    homeDirectory = "/home/orion";
    username = "orion";
  };

  catppuccin.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
