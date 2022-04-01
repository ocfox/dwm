{
  description = "Customized dwm";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    in
    {
      overlay = final: prev: {
        dwm = with final; let nix = final.nix; in stdenv.mkDerivation {
          name = "dwm";
          buildInputs = (old.buildInputs or []) ++ [ final.xorg.libXext ];
          src = builtins.path { path = ./.; name = "dwm"; };
        };
      };
      defaultPackage = forAllSystems (system: (import nixpkgs {
        inherit system;
        overlays = [ self.overlay nix.overlay ];
      }).dwm);
    };
}
