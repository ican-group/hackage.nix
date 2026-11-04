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
      identifier = { name = "gargamelle-workflow"; version = "0.1.0.0"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/gargamelle";
      url = "";
      synopsis = "Synthesis workflow, Crem state machine, and end-to-end integration";
      description = "Synthesis workflow orchestration, Crem verified state machine integration,\nand end-to-end CEGIS execution for Gargamelle. Connects logical reasoning,\nmodels, evidence, effects, and sandboxes into an automated synthesizer.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."tree-diff" or (errorHandler.buildDepError "tree-diff"))
          (hsPkgs."crem" or (errorHandler.buildDepError "crem"))
          (hsPkgs."singletons-base" or (errorHandler.buildDepError "singletons-base"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
          (hsPkgs."gargamelle-evidence" or (errorHandler.buildDepError "gargamelle-evidence"))
          (hsPkgs."gargamelle-effect" or (errorHandler.buildDepError "gargamelle-effect"))
          (hsPkgs."gargamelle-persistence" or (errorHandler.buildDepError "gargamelle-persistence"))
          (hsPkgs."gargamelle-sandbox" or (errorHandler.buildDepError "gargamelle-sandbox"))
          (hsPkgs."gargamelle-sheaf" or (errorHandler.buildDepError "gargamelle-sheaf"))
          (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
          (hsPkgs."gargamelle-logic" or (errorHandler.buildDepError "gargamelle-logic"))
          (hsPkgs."sqlite-simple" or (errorHandler.buildDepError "sqlite-simple"))
          (hsPkgs."beam-core" or (errorHandler.buildDepError "beam-core"))
          (hsPkgs."beam-sqlite" or (errorHandler.buildDepError "beam-sqlite"))
          (hsPkgs."lattices" or (errorHandler.buildDepError "lattices"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
            (hsPkgs."gargamelle-fol" or (errorHandler.buildDepError "gargamelle-fol"))
            (hsPkgs."gargamelle-equational" or (errorHandler.buildDepError "gargamelle-equational"))
            (hsPkgs."gargamelle-evidence" or (errorHandler.buildDepError "gargamelle-evidence"))
            (hsPkgs."gargamelle-effect" or (errorHandler.buildDepError "gargamelle-effect"))
            (hsPkgs."gargamelle-persistence" or (errorHandler.buildDepError "gargamelle-persistence"))
            (hsPkgs."gargamelle-sandbox" or (errorHandler.buildDepError "gargamelle-sandbox"))
            (hsPkgs."gargamelle-sheaf" or (errorHandler.buildDepError "gargamelle-sheaf"))
            (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
            (hsPkgs."gargamelle-logic" or (errorHandler.buildDepError "gargamelle-logic"))
            (hsPkgs."gargamelle-workflow" or (errorHandler.buildDepError "gargamelle-workflow"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."beam-core" or (errorHandler.buildDepError "beam-core"))
            (hsPkgs."beam-sqlite" or (errorHandler.buildDepError "beam-sqlite"))
            (hsPkgs."sqlite-simple" or (errorHandler.buildDepError "sqlite-simple"))
            (hsPkgs."crem" or (errorHandler.buildDepError "crem"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."tree-diff" or (errorHandler.buildDepError "tree-diff"))
            (hsPkgs."lattices" or (errorHandler.buildDepError "lattices"))
          ];
          buildable = true;
        };
      };
    };
  }