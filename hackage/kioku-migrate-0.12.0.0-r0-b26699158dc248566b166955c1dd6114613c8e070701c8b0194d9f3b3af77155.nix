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
      identifier = { name = "kioku-migrate"; version = "0.12.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/kioku";
      url = "";
      synopsis = "The kioku schema migration entry point";
      description = "Applies kioku's migration chain and then reconciles keiro's read-model\nregistry to the identity the compiled read models declare.\n.\nThis lives in its own package rather than as an executable of\nkioku-migrations because it depends on kioku-core (for the read-model\nschemas), and kioku-core's test suite depends on\nkioku-migrations:test-support. Cabal's solver detects dependency cycles at\npackage granularity, so an executable stanza inside kioku-migrations would\nclose that cycle and make the whole project unsolvable -- even though the\ncomponent graph itself is acyclic.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "kioku-migrate" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."kioku-core" or (errorHandler.buildDepError "kioku-core"))
            (hsPkgs."kioku-migrations" or (errorHandler.buildDepError "kioku-migrations"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pg-migrate-cli" or (errorHandler.buildDepError "pg-migrate-cli"))
            (hsPkgs."pg-migrate-import-codd" or (errorHandler.buildDepError "pg-migrate-import-codd"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }