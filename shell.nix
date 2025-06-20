{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    capnproto
  ];
  nativeBuildInputs = with pkgs; [
    cmake
    include-what-you-use
    llvmPackages_20.clang
    llvmPackages_20.clang-tools
    ninja
  ];
}
