{theme, ...}: let
  snowflake = builtins.fetchurl rec {
    name = "Logo-${sha256}.svg";
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
  };
  inherit (theme) x;
in
  with theme.colors; ''
    * {
      /* `otf-font-awesome` is required to be installed for icons */
      font-family: Material Design Icons, Lexend, Iosevka Nerd Font;
    }

    window#waybar {
      background-color: rgba(24, 24, 37, 0.8);
      border-radius: 0px;
      color: ${x text};
      box-shadow: 2px 3px 2px 2px #151515;
      font-size: 14px;
      transition-property: background-color;
      transition-duration: 0.5s;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    #pulseaudio {
      color: ${x green};
    }

    #custom-vpn,
    #network {
      color: ${x pink};
    }

    #cpu {
      color: ${x maroon};
    }

    #memory {
      color: ${x peach};
    }

    #clock {
      font-weight: 700;
      font-family: "Iosevka Term";
      padding: 0px 5px 0px 5px;
    }

    #workspaces button {
      background-color: transparent;
      /* Use box-shadow instead of border so the text isn't offset */
      color: ${x blue};
      padding-left: 10px;
      box-shadow: inset 0 -3px transparent;
      transition: all 400ms cubic-bezier(0.250, 0.250, 0.555, 1.425);
    }

    #workspaces button:hover {
      color: ${x blue};
      box-shadow: inherit;
      text-shadow: inherit;
    }

    #custom-power {
        color: ${x red};
        padding: 0px 14px 0px 14px;
        margin-bottom: 20px;
    }

    #workspaces button.active {
      color: ${x yellow};
      transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }
    #workspaces button.urgent {
      background-color: ${x peach};
    }
    #clock,
    #network,
    #custom-swallow,
    #cpu,
    #battery,
    #backlight,
    #memory,
    #workspaces,
    #custom-todo,
    #custom-lock,
    #custom-vpn,
    #custom-weather,
    #custom-power,
    #custom-crypto,
    #volume,
    #pulseaudio {
      border-radius: 8px;
      background-color: rgba(49, 50, 68, 0.35);
      padding: 0px 14px 0px 14px;
      margin: 3px 0px 3px 0px;
    }

    #custom-lock {
        color: ${x blue};
    }

    #custom-search {
      background-image: url("${snowflake}");
      background-size: 65%;
      background-position: center;
      padding: 0 13px;
      background-repeat: no-repeat;
    }
    #backlight {
      color: ${x yellow};
    }
    #battery {
      color: ${x green};
    }

    #battery.warning {
      color: ${x maroon};
    }

    #battery.critical:not(.charging) {
      color: ${x red};
    }
    tooltip {
      font-family: 'Lato', sans-serif;
      border-radius: 15px;
      padding: 20px;
      margin: 30px;
    }
    tooltip label {
      font-family: 'Lato', sans-serif;
      padding: 20px;
    }
  ''