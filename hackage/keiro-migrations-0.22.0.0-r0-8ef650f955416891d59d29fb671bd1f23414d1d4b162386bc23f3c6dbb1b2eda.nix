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
    flags = { legacy-codd-tools = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "keiro-migrations"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Schema migrations for keiro";
      description = "Embedded PostgreSQL schema migrations and a migration runner for the Keiro\nevent-sourcing framework.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
          (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
          (hsPkgs."pg-migrate-embed" or (errorHandler.buildDepError "pg-migrate-embed"))
          (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optionals (flags.legacy-codd-tools) [
          (hsPkgs."codd" or (errorHandler.buildDepError "codd"))
          (hsPkgs."codd-extras" or (errorHandler.buildDepError "codd-extras"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      exes = {
        "keiro-migrate" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pg-migrate-cli" or (errorHandler.buildDepError "pg-migrate-cli"))
            (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-write-expected-schema" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."codd-extras".components.sublibs.ephemeral or (errorHandler.buildDepError "codd-extras:ephemeral"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = if !flags.legacy-codd-tools then false else true;
        };
      };
      tests = {
        "keiro-migrations-test" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
            (hsPkgs."pg-migrate-test-support" or (errorHandler.buildDepError "pg-migrate-test-support"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          buildable = true;
        };
        "keiro-migrations-legacy-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."codd" or (errorHandler.buildDepError "codd"))
            (hsPkgs."codd-extras" or (errorHandler.buildDepError "codd-extras"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."contravariant-extras" or (errorHandler.buildDepError "contravariant-extras"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.legacy-codd-tools then false else true;
        };
      };
    };
  }