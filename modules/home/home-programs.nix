{ pkgs, ... }:
{
  home.packages = with pkgs; [
    curl
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        theme_background = true;
        update_ms = 1000;
        proc_sorting = "cpu direct";
      };
    };
    eza = {
      enable = true;
      icons = "auto";
    };
  };
}
