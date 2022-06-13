
{ pkgs ? import <nixpkgs> {}, unstable  ? import <unstable> {} }:
let
  pluto = pkgs.stdenv.mkDerivation {
    name = "pluto";
    src = pkgs.fetchFromGitHub {
      owner = "ZystemOS";
      repo = "pluto";
      rev = "2ca66e3c394464c4ae9c5e3212cbb7eee7db7b3c";
      sha256 = "1cbrqrzxpkkz8jhl0kcymy1gpmk964vw1wy4m38nyh6pz8147j4c";
    };
      checkPhase = ''
        patchShebangs .
        makeiso.sh
      '';
    buildInputs = [ unstable.zig pkgs.xorriso pkgs.grub pkgs.stdenv pkgs.which pkgs.grub2 ];
    buildPhase = ''
      export XDG_CACHE_HOME=".cache"
      patchShebangs ./makeiso.sh
      zig build -p $out
    '';
    installPhase = "true";
    postInstall = "true";
  };
in
pluto