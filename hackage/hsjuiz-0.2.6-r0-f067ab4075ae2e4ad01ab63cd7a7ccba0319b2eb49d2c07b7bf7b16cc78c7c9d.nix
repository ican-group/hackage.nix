{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {};
    package = {
      specVersion = "3.0";
      identifier = { name = "hsjuiz"; version = "0.2.6"; };
      license = "(MIT OR Apache-2.0)";
      copyright = "";
      maintainer = "ysuga";
      author = "ysuga";
      homepage = "https://github.com/OpenJUIZ/juiz/tree/main/bindings/hsjuiz";
      url = "";
      synopsis = "Write juiz processes and containers in Haskell";
      description = "Write Process / Container / Component plugins of\n<https://github.com/OpenJUIZ/juiz juiz> (middleware for robots and IoT) in Haskell.\nA plugin is a shared library (a cabal @foreign-library@) that juiz loads as\n@language: \"haskell\"@. Values are passed through the C functions of libjuiz_sdk.\n.\nBuilding a plugin needs libjuiz_sdk of the same version as juiz. Download it from\n<https://github.com/OpenJUIZ/juiz/releases GitHub Releases>\n(@juiz_sdk-\\<version\\>-\\<target\\>.tar.gz@, or @scripts/install-juiz-sdk.sh@ in the juiz repository)\nand add it to @cabal.project@:\n.\n> package hsjuiz\n>   extra-lib-dirs: <sdk>/lib\n>   ghc-options: -optl-Wl,-rpath,<sdk>/lib\n.\njuiz (ロボット・IoT 向けミドルウェア) の Process / Container を Haskell で書くためのライブラリ。\n使い方は README を参照。";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
        ];
        libs = [ (pkgs."juiz_sdk" or (errorHandler.sysDepError "juiz_sdk")) ];
        buildable = true;
      };
    };
  }