{
  imports = [
    ./disko.nix
    ./docker.nix
    ./user.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    trusted-users = [ "root" ];
    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };
}
