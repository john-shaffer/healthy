{
  description = "healthy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; };
      let
        healthy = buildGoModule {
          name = "healthy";
          src = self;
          vendorHash = null;
        };
        };
      in with pkgs; {
        devShells.default = mkShell { buildInputs = [ go ]; };
        packages = {
          inherit healthy;
          default = healthy;
        };
      });
}
