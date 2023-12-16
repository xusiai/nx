{pkgs, inputs, ...}: {
  nixpkgs.config.allowUnfree = false;
  home.packages = with pkgs; [
    (symlinkJoin {
      inherit (ledger-live-desktop) name;
      paths = [ledger-live-desktop];
      buildInputs = [makeWrapper];
      postBuild = "wrapProgram $out/bin/ledger-live-desktop --add-flags --use-gl=desktop";
    })
    inputs.thorium.packages.${pkgs.system}.default
    logseq
    ledger_agent
    caprine-bin
    pulseaudio
    brave
    session-desktop
    transmission-gtk
    prismlauncher
    tdesktop
    gimp
    wireshark
    inkscape
    keepassxc
    dconf
  ];
}