{
  description = "healthy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          function system (
            import nixpkgs {
              inherit system;
            }
          )
        );
    in
    {
      devShells = forAllSystems (
        system: pkgs: {
          default = pkgs.mkShell {
            buildInputs = [ pkgs.go ];
          };
        }
      );
      packages = forAllSystems (
        system: pkgs:
        let
          healthy = pkgs.buildGoModule {
            name = "healthy";
            src = self;
            vendorHash = null;
          };
          healthy-image = pkgs.dockerTools.buildLayeredImage {
            name = "rs.shaffe/healthy";
            config = {
              Cmd = [ "${healthy}/bin/healthy" ];
            };
          };
        in
        {
          inherit healthy healthy-image;
          default = healthy;
        }
      );
    };
}
