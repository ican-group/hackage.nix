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
      specVersion = "1.18";
      identifier = { name = "waterfall-cad"; version = "0.8.0.0"; };
      license = "LGPL-2.1-only";
      copyright = "2023 Joe Warren";
      maintainer = "josephmarkwarren@gmail.com";
      author = "Joe Warren";
      homepage = "https://github.com/joe-warren/opencascade-hs#readme";
      url = "";
      synopsis = "Declarative CAD/Solid Modeling Library";
      description = "Please see the README on GitHub at <https://github.com/joe-warren/opencascade-hs#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."lattices" or (errorHandler.buildDepError "lattices"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."opencascade-hs" or (errorHandler.buildDepError "opencascade-hs"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
        ];
        buildable = true;
      };
    };
  }