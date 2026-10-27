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
      identifier = { name = "kiroku-store-migrations"; version = "0.7.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/kiroku";
      url = "";
      synopsis = "Schema migrations for kiroku-store";
      description = "Native pg-migrate component, Codd history mapping, and migration executable\nfor installing and upgrading the PostgreSQL schema used by @kiroku-store@.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
          (hsPkgs."pg-migrate-embed" or (errorHandler.buildDepError "pg-migrate-embed"))
          (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      exes = {
        "kiroku-store-migrate" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pg-migrate-cli" or (errorHandler.buildDepError "pg-migrate-cli"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "kiroku-store-migrations-test" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
            (hsPkgs."pg-migrate-test-support" or (errorHandler.buildDepError "pg-migrate-test-support"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
      };
    };
  }