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
      identifier = { name = "keiro-ops"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/keiro#readme";
      url = "";
      synopsis = "Operational command-line interface for Keiro deployments";
      description = "A standalone database-only console and embeddable command tree for inspecting\nand operating Keiro deployments.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
          (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
          (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
          (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
          (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      exes = {
        "keiro-ops" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro-ops" or (errorHandler.buildDepError "keiro-ops"))
          ];
          buildable = true;
        };
      };
      tests = {
        "keiro-ops-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-ops" or (errorHandler.buildDepError "keiro-ops"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pgmq-migration" or (errorHandler.buildDepError "pgmq-migration"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.keiro-ops.components.exes.keiro-ops or (pkgs.pkgsBuildBuild.keiro-ops or (errorHandler.buildToolDepError "keiro-ops:keiro-ops")))
          ];
          buildable = true;
        };
      };
    };
  }