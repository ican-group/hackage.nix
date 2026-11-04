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
      identifier = { name = "gargamelle-effect"; version = "0.1.0.0"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/gargamelle";
      url = "";
      synopsis = "Penelope polycategorical effect orchestration with Polytropos routers";
      description = "Penelope polycategorical effect orchestration layer with Polytropos O(1)\nrouters, optics, and fusion for Gargamelle. Provides pure optic dispatch,\narrow loop handling, strand fusion, and database and sandbox execution\nstrands generalizing unary and binary effects.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."kan-extensions" or (errorHandler.buildDepError "kan-extensions"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
          (hsPkgs."polytropos-profunctors" or (errorHandler.buildDepError "polytropos-profunctors"))
          (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
          (hsPkgs."gargamelle-persistence" or (errorHandler.buildDepError "gargamelle-persistence"))
          (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
          (hsPkgs."penelope-effects" or (errorHandler.buildDepError "penelope-effects"))
          (hsPkgs."penelope-static" or (errorHandler.buildDepError "penelope-static"))
          (hsPkgs."beam-core" or (errorHandler.buildDepError "beam-core"))
          (hsPkgs."beam-sqlite" or (errorHandler.buildDepError "beam-sqlite"))
          (hsPkgs."sqlite-simple" or (errorHandler.buildDepError "sqlite-simple"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gargamelle-effect" or (errorHandler.buildDepError "gargamelle-effect"))
            (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
            (hsPkgs."gargamelle-persistence" or (errorHandler.buildDepError "gargamelle-persistence"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."polytropos-profunctors" or (errorHandler.buildDepError "polytropos-profunctors"))
            (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
            (hsPkgs."penelope-effects" or (errorHandler.buildDepError "penelope-effects"))
            (hsPkgs."penelope-static" or (errorHandler.buildDepError "penelope-static"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
            (hsPkgs."kan-extensions" or (errorHandler.buildDepError "kan-extensions"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }