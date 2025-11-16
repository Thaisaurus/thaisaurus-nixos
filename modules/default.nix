{
  imports = [
    ./disko.nix
    ./docker.nix
    ./user.nix
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    trusted-users = [ "root" ];
    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "25.05";
}
