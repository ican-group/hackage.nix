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
      identifier = { name = "LPFP-core"; version = "1.1.5"; };
      license = "BSD-3-Clause";
      copyright = "2023 Scott N. Walck";
      maintainer = "walck@lvc.edu";
      author = "Scott N. Walck";
      homepage = "https://lpfp.io";
      url = "";
      synopsis = "Code for the book Learn Physics with Functional Programming";
      description = "Haskell code to help the user learn mechanics of one particle,\nmechanics of multiple interacting particles, and electromagnetic theory.\nLPFP-core elides all of the graphics dependencies of LPFP,\nso it has a much better chance of building without problems.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
    };
  }