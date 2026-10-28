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
      identifier = { name = "keiro-pgmq"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/keiro#readme";
      url = "";
      synopsis = "PostgreSQL job-queue (PGMQ) integration for Keiro";
      description = "A typed background-job queue for Keiro applications on top of PGMQ (the\nPostgreSQL-native message queue) and shibuya (a Broadway-style worker\nframework). Declare a @Job@ value bundling a queue, a payload codec, and a\nretry/dead-letter policy, then write a plain domain handler of type\n@p -> Eff es JobOutcome@.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
          (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
          (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
          (hsPkgs."pgmq-config" or (errorHandler.buildDepError "pgmq-config"))
          (hsPkgs."pgmq-core" or (errorHandler.buildDepError "pgmq-core"))
          (hsPkgs."pgmq-effectful" or (errorHandler.buildDepError "pgmq-effectful"))
          (hsPkgs."pgmq-hasql" or (errorHandler.buildDepError "pgmq-hasql"))
          (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
          (hsPkgs."shibuya-pgmq-adapter" or (errorHandler.buildDepError "shibuya-pgmq-adapter"))
          (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      tests = {
        "keiro-pgmq-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
            (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
            (hsPkgs."hs-opentelemetry-exporter-in-memory" or (errorHandler.buildDepError "hs-opentelemetry-exporter-in-memory"))
            (hsPkgs."hs-opentelemetry-propagator-w3c" or (errorHandler.buildDepError "hs-opentelemetry-propagator-w3c"))
            (hsPkgs."hs-opentelemetry-sdk" or (errorHandler.buildDepError "hs-opentelemetry-sdk"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."pgmq-config" or (errorHandler.buildDepError "pgmq-config"))
            (hsPkgs."pgmq-core" or (errorHandler.buildDepError "pgmq-core"))
            (hsPkgs."pgmq-effectful" or (errorHandler.buildDepError "pgmq-effectful"))
            (hsPkgs."pgmq-migration" or (errorHandler.buildDepError "pgmq-migration"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."shibuya-pgmq-adapter" or (errorHandler.buildDepError "shibuya-pgmq-adapter"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }