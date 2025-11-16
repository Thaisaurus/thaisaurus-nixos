{ inputs, pkgs, ... }:
{
  nix.settings.trusted-users = [ "orion" ];
  users.users.orion = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "wheel"
    ];
    createHome = true;
    group = "users";
    shell = pkgs.nushell;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHEz+2RXx8TnDv5priZHyySuqos71oon3bIHbVil+HvL oriontrandev@gmail.com"
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    sharedModules = [
      inputs.catppuccin.homeModules.catppuccin
      inputs.nixvim.homeModules.nixvim
    ];
    users.orion = import (inputs.self + /modules/home);
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
