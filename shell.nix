{ pkgs ? import <nixpkgs> {}
, libcxx ? false # Whether to use libc++ toolchain and libraries instead of libstdc++
}:

let
  lib  = pkgs.lib;
  llvm = pkgs.llvmPackages_20;
  mkShell = pkgs.mkShell.override (lib.optionalAttrs libcxx { stdenv = llvm.libcxxStdenv; });
  capnproto = pkgs.capnproto.override (lib.optionalAttrs libcxx { clangStdenv = llvm.libcxxStdenv; });
in mkShell {
  buildInputs = [
    capnproto
    llvm.libcxx
    llvm.libcxxabi
  ];
  nativeBuildInputs = with pkgs; [
    cmake
    include-what-you-use
    llvm.clang
    llvm.clang-tools
    ninja
  ];
}
