{
  description = "Dev shell with cli tool Just and LaTeX for report";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-medium
          latexmk
          minted
          subfiles
          xcolor
          float
          hyperref
          listings
          acro
          subcaption
          ;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.just
          tex
        ];
      };
      packages.x86_64-linux.default = pkgs.just;
    };
}

