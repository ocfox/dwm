{
  description = "Customized dwm";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in
    {
      overlay = final: prev: {
        dwm = with final; let nix = final.nix; in stdenv.mkDerivation {
          name = "dwm";
          buildInputs = [ final.xorg.libXext ];
          src = builtins.path { path = ./.; name = "dwm"; };
        };
      };
      defaultPackage = system: (import nixpkgs {
        inherit system;
        overlays = [ self.overlay ];
      }).dwm;
    };
}
