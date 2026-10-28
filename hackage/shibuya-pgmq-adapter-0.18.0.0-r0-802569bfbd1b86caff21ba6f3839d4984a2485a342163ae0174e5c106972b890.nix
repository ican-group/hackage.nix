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
      specVersion = "3.12";
      identifier = { name = "shibuya-pgmq-adapter"; version = "0.18.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "PGMQ adapter for the Shibuya queue processing framework";
      description = "A Shibuya adapter that integrates with pgmq (PostgreSQL Message Queue)\nusing the pgmq-hs client library. Provides visibility timeout-based\nleasing, automatic retry handling, and optional dead-letter queue support.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
          (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
          (hsPkgs."pgmq-core" or (errorHandler.buildDepError "pgmq-core"))
          (hsPkgs."pgmq-effectful" or (errorHandler.buildDepError "pgmq-effectful"))
          (hsPkgs."pgmq-hasql" or (errorHandler.buildDepError "pgmq-hasql"))
          (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
          (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "shibuya-pgmq-adapter-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
            (hsPkgs."hs-opentelemetry-exporter-in-memory" or (errorHandler.buildDepError "hs-opentelemetry-exporter-in-memory"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pgmq-core" or (errorHandler.buildDepError "pgmq-core"))
            (hsPkgs."pgmq-effectful" or (errorHandler.buildDepError "pgmq-effectful"))
            (hsPkgs."pgmq-hasql" or (errorHandler.buildDepError "pgmq-hasql"))
            (hsPkgs."pgmq-migration" or (errorHandler.buildDepError "pgmq-migration"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."shibuya-pgmq-adapter" or (errorHandler.buildDepError "shibuya-pgmq-adapter"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }