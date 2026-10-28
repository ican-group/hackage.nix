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
      identifier = { name = "keiro-test-support"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/keiro#readme";
      url = "";
      synopsis = "Shared PostgreSQL test fixtures for Keiro test suites";
      description = "Suite-level ephemeral-PostgreSQL fixtures shared by the Keiro test\nsuites. Implements the ephemeral-pg template-database pattern: one cached\nserver per suite, one migrated template database, and a clean cloned\ndatabase per example.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
          (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
          (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
          (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
          (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
        ];
        buildable = true;
      };
      tests = {
        "keiro-test-support-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }