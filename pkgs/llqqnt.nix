{ pkgs, ... }:

let
  llSrc = builtins.fetchGit {
    url = "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT";
    rev = "ce0360ed426f27957a86fe3941717bd667b28390";
    submodules = true;
  };
in
pkgs.qq.overrideAttrs (oldAttrs: {
  pname = "llqqnt";

  postInstall = ''
    mkdir $out/opt/QQ/resources/app/LiteLoader
    cp -r ${llSrc.outPath}/* $out/opt/QQ/resources/app/LiteLoader
    sed -i 's/"main": ".\/app_launcher\/index.js"/"main": ".\/LiteLoader"/' $out/opt/QQ/resources/app/package.json
  '';
})
