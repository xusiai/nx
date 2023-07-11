{ ...}: {
  home.persistence."/persist/home/sioodmy" = {
    allowOther = true;
    files = [".database.kdbx"];
    directories = [
      "download"
      "music"
      "dev"
      "docs"
      "vids"
      "other"
      ".local/share/Steam"
      {
        directory = ".local/share/zoxide";
        method = "symlink";
      }
      {
        directory = ".steam";
        method = "symlink";
      }
      ".ssh"
      ".local/share/direnv"
      ".local/share/PrismLauncher"
      ".local/share/TelegramDesktop"
      ".local/share/keyrings"
      ".config/Caprine"
      ".config/WebCord"
      ".config/BraveSoftware/"
      ".cache/BraveSoftware/"
      ".cache/thunderbird/"
      ".thunderbird"
      ".cache/spotify"
      ".cache/starship"
      ".local/share/nheko"
      ".config/nheko"
      ".cache/nix-index"
      ".config/obs-studio"
    ];
  };
}