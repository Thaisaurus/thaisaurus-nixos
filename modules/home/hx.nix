{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    extraPackages = [
      pkgs.docker-compose-language-service
      pkgs.yaml-language-server
    ];
    settings = {
      editor = {
        line-number = "relative";
        cursor-shape = {
          normal = "block";
          insert = "bar";
        };
        soft-wrap.enable = true;
        indent-guides = {
          character = "┊";
          render = true;
          skip-levels = 1;
        };
        jump-label-alphabet = "sadfjklewcmpgh";
        file-picker = {
          hidden = false;
        };
      };
      keys = {
        normal = {
          ";" = "command_mode";
          "V" = "extend_line_below";
          "esc" = "collapse_selection";
          "K" = "hover";
          "g" = {
            j = "goto_last_line";
            k = "goto_file_start";
          };
        };
        select = {
          g = {
            j = "goto_last_line";
            k = "goto_file_start";
          };
        };
      };
    };
    languages.language = [
      {
        name = "yaml";
        auto-format = true;
        formatter = {
          command = "prettierd";
          args = [
            "%{buffer_name}"
          ];
        };
        language-servers = [
          "yaml-language-server"
        ];
      }
      {
        name = "docker-compose";
        auto-format = true;
        formatter = {
          command = "prettierd";
          args = [
            "%{buffer_name}"
          ];
        };
        language-servers = [
          "docker-compose-langserver"
          "yaml-language-server"
        ];
      }
    ];
  };
}
