{
  inputs = {
    prismlauncher.url = "github:PrismLauncher/PrismLauncher";
  };
  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.nixos-thinkcent = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./configuration.nix ];
    };
  };
}
