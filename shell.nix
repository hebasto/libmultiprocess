{ pkgs ? import <nixpkgs> {}
, enableLibcxx ? false # Whether to use libc++ toolchain and libraries instead of libstdc++
}:

let
  lib  = pkgs.lib;
  llvm = pkgs.llvmPackages_20;
  capnproto = pkgs.capnproto.override (lib.optionalAttrs enableLibcxx { clangStdenv = llvm.libcxxStdenv; });
  clang = if enableLibcxx then llvm.libcxxClang else llvm.clang;
  clang-tools = llvm.clang-tools.override { inherit enableLibcxx; };
in pkgs.mkShell {
  buildInputs = [
    capnproto
    llvm.libcxx
  ];
  nativeBuildInputs = with pkgs; [
    clang
    clang-tools
    cmake
    include-what-you-use
    ninja
  ];
}
