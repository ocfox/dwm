{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              dwm = prev.dwm.overrideAttrs (oldAttrs: rec {
                version = "master";
                src = ./src;
              });
            })
          ];
        };
      in
      rec {
        apps = {
          dwm = {
            type = "app";
          };
        };

        packages.dwm = pkgs.dwm;
        defaultApp = apps.dwm;
        defaultPackage = pkgs.dwm;
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ xorg.libX11 xorg.libXft xorg.libXinerama gcc bear xorg.libXext ];
        };
      }
    );
}
