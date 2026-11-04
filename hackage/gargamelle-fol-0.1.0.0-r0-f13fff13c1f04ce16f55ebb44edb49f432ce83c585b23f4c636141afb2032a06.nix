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
      identifier = { name = "gargamelle-fol"; version = "0.1.0.0"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/gargamelle";
      url = "";
      synopsis = "First-order logic institution and streaming Z3 SMT pipe for Gargamelle";
      description = "First-order logic institution and streaming Z3 SMT solver pipeline for\nGargamelle. Provides hyperdoctrine structures, quantifier elimination,\nand refinement calculus generation for formal program verification.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
          (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."gargamelle-fol" or (errorHandler.buildDepError "gargamelle-fol"))
            (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
            (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }