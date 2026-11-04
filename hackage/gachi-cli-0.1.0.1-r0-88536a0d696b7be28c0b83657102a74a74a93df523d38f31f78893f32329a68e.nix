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
      identifier = { name = "gachi-cli"; version = "0.1.0.1"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/gachi";
      url = "";
      synopsis = "Unified command-line interface for the gachi ecosystem engine";
      description = "Turnkey command-line interface providing declarative project initialization\n('gachi init'), harmonic configuration propagation ('gachi sync'),\nnon-destructive codebase retrofitting ('gachi retrofit'), ecosystem roadmap\ngovernance ('gachi plan'), and repository diagnostics ('gachi doctor').";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."gachi-core" or (errorHandler.buildDepError "gachi-core"))
          (hsPkgs."gachi-schema" or (errorHandler.buildDepError "gachi-schema"))
          (hsPkgs."gachi-scaffold" or (errorHandler.buildDepError "gachi-scaffold"))
          (hsPkgs."gachi-sync" or (errorHandler.buildDepError "gachi-sync"))
          (hsPkgs."gachi-retrofit" or (errorHandler.buildDepError "gachi-retrofit"))
        ];
        buildable = true;
      };
      exes = {
        "gachi" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gachi-cli" or (errorHandler.buildDepError "gachi-cli"))
          ];
          buildable = true;
        };
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gachi-cli" or (errorHandler.buildDepError "gachi-cli"))
            (hsPkgs."gachi-schema" or (errorHandler.buildDepError "gachi-schema"))
            (hsPkgs."gachi-scaffold" or (errorHandler.buildDepError "gachi-scaffold"))
            (hsPkgs."gachi-sync" or (errorHandler.buildDepError "gachi-sync"))
            (hsPkgs."gachi-retrofit" or (errorHandler.buildDepError "gachi-retrofit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }