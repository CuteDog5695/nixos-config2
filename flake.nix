{
  description="Modular NixOS configuration with gaming and desktop setup";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs = { nixpkgs, nix-gaming, ... }:
    let
      system = "x86_64-linux"; # Change this if needed
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./hardware-configuration.nix
          ./modules/boot.nix
          ./modules/networking.nix
          ./modules/locales.nix
          ./modules/services.nix
          ./modules/users.nix
          ./modules/packages.nix
        ];
      };
    };
}

