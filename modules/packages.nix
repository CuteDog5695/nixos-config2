{ config, pkgs, nix-gaming, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    speedtest-go
    git
    neofetch
    fastfetch
    nitch
    flatpak
    pkgs.alacritty
    vscode
    pkgs.flameshot
    pkgs.vlc
    spotify
    vesktop
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
    nix-gaming.packages.${pkgs.hostPlatform.system}.osu-lazer-bin
    libreoffice-qt
    whatsapp-for-linux
    pkgs.chromium
    pkgs.epson-escpr2
    pkgs.zsh
    tree
    pkgs.nerdfonts
    starship
    pkgs.yt-dlp
    unzip
    konsave
    audacity
    pkgs.element-desktop
    dig
  ];

  nix.settings = {
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
  };

  nixpkgs.config.allowUnfree = true;
}
