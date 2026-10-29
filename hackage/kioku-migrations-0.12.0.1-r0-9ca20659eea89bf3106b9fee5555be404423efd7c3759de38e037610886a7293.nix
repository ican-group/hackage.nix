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
      identifier = { name = "kioku-migrations"; version = "0.12.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/kioku";
      url = "";
      synopsis = "Schema migrations for kioku";
      description = "Owns kioku schema evolution as a native pg-migrate component and composes\nit with the kiroku and keiro migration components.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
          (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
          (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
          (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
          (hsPkgs."pg-migrate-embed" or (errorHandler.buildDepError "pg-migrate-embed"))
          (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      sublibs = {
        "test-support" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kioku-migrations" or (errorHandler.buildDepError "kioku-migrations"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          buildable = true;
        };
      };
      tests = {
        "kioku-migrations-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."kioku-migrations" or (errorHandler.buildDepError "kioku-migrations"))
            (hsPkgs."kioku-migrations".components.sublibs.test-support or (errorHandler.buildDepError "kioku-migrations:test-support"))
            (hsPkgs."kiroku-store-migrations" or (errorHandler.buildDepError "kiroku-store-migrations"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pg-migrate-embed" or (errorHandler.buildDepError "pg-migrate-embed"))
            (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }