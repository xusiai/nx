{pkgs, ...}: let
  inherit (builtins) attrValues;
in {
  environment.systemPackages = attrValues {
    inherit
      (pkgs)
      wl-clipboard
      librewolf
      mpv
      ytmdl
      yt-dlp
      jellyfinmediaplayer
      imv
      scli
      signal-cli
      clang
      gnumake
      cargo
      go
      gcc
      git
      ripgrep
      zoxide
      fzf
      eza
      tealdeer
      glow
      hyperfine
      imagemagick
      ffmpeg-full
      catimg
      nmap
      xh
      grex
      jq
      rsync
      figlet
      qrencode
      unzip
      ;
  };
}
