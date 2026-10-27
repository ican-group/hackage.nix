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
      specVersion = "1.12";
      identifier = { name = "waterfall-cad-svg"; version = "0.7.0.0"; };
      license = "LGPL-2.1-only";
      copyright = "2025 Joe Warren";
      maintainer = "josephmarkwarren@gmail.com";
      author = "Joe Warren";
      homepage = "https://github.com/joe-warren/opencascade-hs#readme";
      url = "";
      synopsis = "Declarative CAD/Solid Modeling Library, SVG Support";
      description = "Please see the README on GitHub at <https://github.com/joe-warren/opencascade-hs#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."opencascade-hs" or (errorHandler.buildDepError "opencascade-hs"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."svg-tree" or (errorHandler.buildDepError "svg-tree"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."waterfall-cad" or (errorHandler.buildDepError "waterfall-cad"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."opencascade-hs" or (errorHandler.buildDepError "opencascade-hs"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."svg-tree" or (errorHandler.buildDepError "svg-tree"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."waterfall-cad" or (errorHandler.buildDepError "waterfall-cad"))
            (hsPkgs."waterfall-cad-svg" or (errorHandler.buildDepError "waterfall-cad-svg"))
          ];
          buildable = true;
        };
      };
    };
  }