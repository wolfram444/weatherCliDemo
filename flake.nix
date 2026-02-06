{
  description = "Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        cargo
        rustc
        rustfmt
      ];
    };
  };
}











# {
#   description = "Flake";

#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
#   };

#   outputs = { self, nixpkgs }: let
#     pkgs = nixpkgs.legacyPackages."86_64-linux";
#      in {
#       devShells.${system}.default = pkgs.mkShell{
#         buildInputs = with  pkgs; [
#           cargo
#           rustc
#           rustfmt
#         ];
#       };

    

#   };
# }
