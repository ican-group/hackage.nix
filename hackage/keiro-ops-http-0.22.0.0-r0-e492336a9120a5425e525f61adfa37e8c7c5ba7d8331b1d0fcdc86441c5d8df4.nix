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
    flags = { compose-example = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "keiro-ops-http"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/keiro#readme";
      url = "";
      synopsis = "Bounded HTTP transport for the Keiro operational command tree";
      description = "An embeddable WAI application, Warp runner, and database-only executable.\nExposes the supported command tree with bounded reads and confirmed mutations.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
          (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
          (hsPkgs."keiro-ops" or (errorHandler.buildDepError "keiro-ops"))
          (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."wai-websockets" or (errorHandler.buildDepError "wai-websockets"))
          (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
        ];
        buildable = true;
      };
      exes = {
        "keiro-ops-http" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."keiro-ops" or (errorHandler.buildDepError "keiro-ops"))
            (hsPkgs."keiro-ops-http" or (errorHandler.buildDepError "keiro-ops-http"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-ops-http-compose-example" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro-ops" or (errorHandler.buildDepError "keiro-ops"))
            (hsPkgs."keiro-ops-http" or (errorHandler.buildDepError "keiro-ops-http"))
            (hsPkgs."kiroku-metrics" or (errorHandler.buildDepError "kiroku-metrics"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.compose-example then false else true;
        };
      };
      tests = {
        "keiro-ops-http-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."jitsurei" or (errorHandler.buildDepError "jitsurei"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."keiro-ops" or (errorHandler.buildDepError "keiro-ops"))
            (hsPkgs."keiro-ops-http" or (errorHandler.buildDepError "keiro-ops-http"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-metrics" or (errorHandler.buildDepError "kiroku-metrics"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pgmq-migration" or (errorHandler.buildDepError "pgmq-migration"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-extra" or (errorHandler.buildDepError "wai-extra"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.keiro-ops.components.exes.keiro-ops or (pkgs.pkgsBuildBuild.keiro-ops or (errorHandler.buildToolDepError "keiro-ops:keiro-ops")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "inspection-interference" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."jitsurei" or (errorHandler.buildDepError "jitsurei"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-ops" or (errorHandler.buildDepError "keiro-ops"))
            (hsPkgs."keiro-ops-http" or (errorHandler.buildDepError "keiro-ops-http"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
          ];
          buildable = true;
        };
      };
    };
  }