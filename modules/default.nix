{ lib, ... }:
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

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  networking = {
    networkmanager.enable = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  system.stateVersion = "25.05";
}
