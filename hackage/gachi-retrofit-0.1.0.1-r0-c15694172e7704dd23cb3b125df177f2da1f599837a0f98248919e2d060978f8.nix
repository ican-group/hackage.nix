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
      identifier = { name = "gachi-retrofit"; version = "0.1.0.1"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/gachi";
      url = "";
      synopsis = "Codebase retrofitting engine and repository inspector for Gachi";
      description = "Static analysis of arbitrary target checkouts: detects language stacks,\nbuild systems, existing tests, documentation gaps relative to\nDOC_STRATEGY.md, Git hook attribution conformance, and physical\nverification readiness ('gachi retrofit').";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
          (hsPkgs."penelope-effects" or (errorHandler.buildDepError "penelope-effects"))
          (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
          (hsPkgs."gargamelle-effect" or (errorHandler.buildDepError "gargamelle-effect"))
          (hsPkgs."gargamelle-sandbox" or (errorHandler.buildDepError "gargamelle-sandbox"))
          (hsPkgs."gachi-core" or (errorHandler.buildDepError "gachi-core"))
          (hsPkgs."gachi-schema" or (errorHandler.buildDepError "gachi-schema"))
          (hsPkgs."gachi-scaffold" or (errorHandler.buildDepError "gachi-scaffold"))
          (hsPkgs."gachi-sync" or (errorHandler.buildDepError "gachi-sync"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gachi-retrofit" or (errorHandler.buildDepError "gachi-retrofit"))
            (hsPkgs."gachi-core" or (errorHandler.buildDepError "gachi-core"))
            (hsPkgs."gachi-schema" or (errorHandler.buildDepError "gachi-schema"))
            (hsPkgs."gachi-scaffold" or (errorHandler.buildDepError "gachi-scaffold"))
            (hsPkgs."gachi-sync" or (errorHandler.buildDepError "gachi-sync"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
            (hsPkgs."penelope-effects" or (errorHandler.buildDepError "penelope-effects"))
            (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
            (hsPkgs."gargamelle-effect" or (errorHandler.buildDepError "gargamelle-effect"))
            (hsPkgs."gargamelle-sandbox" or (errorHandler.buildDepError "gargamelle-sandbox"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }