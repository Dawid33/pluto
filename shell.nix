{ pkgs ? import <nixpkgs> {}}:
let
  unstable = import (fetchTarball https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz) {};
  shell = pkgs.mkShell {
    nativeBuildInputs = [ unstable.zig pkgs.xorriso pkgs.qemu pkgs.gdb];
  };
in
  shell