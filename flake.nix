{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  
    flake-utils.lib.eachDefaultSystem (system:
  
  let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        cargo
        rustc
        rustfmt
      ];
    };


     packages.${system}.default = pkgs.rustPlatform.buildRustPackage {
     pname = "weather_cli_demo";
     version = "0.1.0";
     src = ./.;
     cargoLock.lockFile = ./Cargo.lock;
  
    };

    apps.default = {
      type = "app";
      program = "${self.packages.${system}.runme}/bin/weather_cli_demo";
  };

  }
    )
}
