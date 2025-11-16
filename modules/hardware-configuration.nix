{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  boot.initrd = {
    availableKernelModules = [
      "xhci_pci"
      "virtio_pci"
      "virtio_scsi"
      "usbhid"
      "sr_mod"
    ];
    kernelModules = [ ];
  };
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
