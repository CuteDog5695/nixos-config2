{ config, pkgs, ... }: {
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    printing = {
      enable = true;
      drivers = [ pkgs.epson-escpr2 ];
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    flatpak.enable = true;
  };

  virtualisation.libvirtd.enable = true;

  programs = {
      # Install firefox.
      firefox.enable = true;
      # Install virt-manager
      virt-manager.enable = true;
      # Install zsh
      zsh = {
        enable = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
      };
      # Install 1Password
      _1password.enable = true;
      _1password-gui = {
        enable = true;
      };
      nix-ld.enable = true;
      steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
      starship.enable = true;
  };
  # Disable PulseAudio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  hardware.nvidia.open=false;
}
