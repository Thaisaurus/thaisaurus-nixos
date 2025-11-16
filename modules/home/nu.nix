{
  lib,
  ...
}:
{
  programs = {
    nushell = {
      enable = true;
      configFile.text = lib.mkAfter ''
        $env.config.show_banner = false;
      '';
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableZshIntegration = lib.mkForce false;
    };
    starship = {
      enable = true;
      enableNushellIntegration = true;
      enableZshIntegration = lib.mkForce false;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[ℕ](green)";
          error_symbol = "[✗](bold red)";
        };
        line_break.disabled = true;
        cmd_duration = {
          min_time = 10;
          show_milliseconds = true;
        };
      };
    };
  };
}
