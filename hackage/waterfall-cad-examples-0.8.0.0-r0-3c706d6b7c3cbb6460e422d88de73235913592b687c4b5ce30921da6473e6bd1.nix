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
      identifier = { name = "waterfall-cad-examples"; version = "0.8.0.0"; };
      license = "LGPL-2.1-only";
      copyright = "2023 Joe Warren";
      maintainer = "josephmarkwarren@gmail.com";
      author = "Joe Warren";
      homepage = "https://github.com/joe-warren/opencascade-hs#readme";
      url = "";
      synopsis = "Examples for Waterfall CAD, a Declarative CAD/Solid Modeling Library";
      description = "Please see the README on GitHub at <https://github.com/joe-warren/opencascade-hs#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."opencascade-hs" or (errorHandler.buildDepError "opencascade-hs"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
          (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
          (hsPkgs."svg-tree" or (errorHandler.buildDepError "svg-tree"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."waterfall-cad" or (errorHandler.buildDepError "waterfall-cad"))
          (hsPkgs."waterfall-cad-svg" or (errorHandler.buildDepError "waterfall-cad-svg"))
          (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
        ];
        buildable = true;
      };
      exes = {
        "waterfall-cad-examples" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."opencascade-hs" or (errorHandler.buildDepError "opencascade-hs"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
            (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
            (hsPkgs."svg-tree" or (errorHandler.buildDepError "svg-tree"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."waterfall-cad" or (errorHandler.buildDepError "waterfall-cad"))
            (hsPkgs."waterfall-cad-examples" or (errorHandler.buildDepError "waterfall-cad-examples"))
            (hsPkgs."waterfall-cad-svg" or (errorHandler.buildDepError "waterfall-cad-svg"))
            (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
          ];
          buildable = true;
        };
      };
      tests = {
        "waterfall-cad-tests" = {
          depends = [
            (hsPkgs."FontyFruity" or (errorHandler.buildDepError "FontyFruity"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."opencascade-hs" or (errorHandler.buildDepError "opencascade-hs"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
            (hsPkgs."rasterific-svg" or (errorHandler.buildDepError "rasterific-svg"))
            (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."svg-tree" or (errorHandler.buildDepError "svg-tree"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."waterfall-cad" or (errorHandler.buildDepError "waterfall-cad"))
            (hsPkgs."waterfall-cad-examples" or (errorHandler.buildDepError "waterfall-cad-examples"))
            (hsPkgs."waterfall-cad-svg" or (errorHandler.buildDepError "waterfall-cad-svg"))
            (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
          ];
          buildable = true;
        };
      };
    };
  }