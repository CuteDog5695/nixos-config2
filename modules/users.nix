{ config, pkgs, ... }: {
  users.users.ethan = {
    isNormalUser = true;
    description = "Ethan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  users.defaultUserShell = pkgs.zsh;
}
