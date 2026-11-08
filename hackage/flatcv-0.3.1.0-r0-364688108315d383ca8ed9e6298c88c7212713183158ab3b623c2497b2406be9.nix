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
      specVersion = "2.4";
      identifier = { name = "flatcv"; version = "0.3.1.0"; };
      license = "ISC";
      copyright = "2025 Adrian Sieber";
      maintainer = "mail@adriansieber.com";
      author = "Adrian Sieber";
      homepage = "https://github.com/ad-si/FlatCV";
      url = "";
      synopsis = "Haskell bindings for FlatCV image processing library";
      description = "FlatCV is a lightweight, dependency-free image processing library\nwritten in C. This package provides Haskell bindings to the FlatCV\nlibrary, enabling fast image operations like grayscale conversion,\nGaussian blur, edge detection, perspective transforms, and more.\n\nThe library is particularly useful for document scanning and\nimage preprocessing tasks.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.c2hs.components.exes.c2hs or (pkgs.pkgsBuildBuild.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
        ];
        buildable = true;
      };
      tests = {
        "flatcv-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."flatcv" or (errorHandler.buildDepError "flatcv"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }