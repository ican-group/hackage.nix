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
    flags = { reaction-hydration-probe = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "keiro"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/keiro#readme";
      url = "";
      synopsis = "Event sourcing framework and workflow engine";
      description = "A library that composes kiroku, keiki, and shibuya into an\nevent-sourcing and workflow-orchestration framework.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."aeson-casing" or (errorHandler.buildDepError "aeson-casing"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."contravariant-extras" or (errorHandler.buildDepError "contravariant-extras"))
          (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
          (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
          (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
          (hsPkgs."hs-opentelemetry-propagator-w3c" or (errorHandler.buildDepError "hs-opentelemetry-propagator-w3c"))
          (hsPkgs."hs-opentelemetry-semantic-conventions" or (errorHandler.buildDepError "hs-opentelemetry-semantic-conventions"))
          (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
          (hsPkgs."keiki-codec-json" or (errorHandler.buildDepError "keiki-codec-json"))
          (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
          (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
          (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "keiro-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."contravariant-extras" or (errorHandler.buildDepError "contravariant-extras"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
            (hsPkgs."hs-opentelemetry-exporter-in-memory" or (errorHandler.buildDepError "hs-opentelemetry-exporter-in-memory"))
            (hsPkgs."hs-opentelemetry-propagator-w3c" or (errorHandler.buildDepError "hs-opentelemetry-propagator-w3c"))
            (hsPkgs."hs-opentelemetry-sdk" or (errorHandler.buildDepError "hs-opentelemetry-sdk"))
            (hsPkgs."hs-opentelemetry-semantic-conventions" or (errorHandler.buildDepError "hs-opentelemetry-semantic-conventions"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiki-codec-json" or (errorHandler.buildDepError "keiki-codec-json"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-migrations" or (errorHandler.buildDepError "keiro-migrations"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "keiro-retention" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiki-codec-json" or (errorHandler.buildDepError "keiki-codec-json"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."shibuya-kiroku-adapter" or (errorHandler.buildDepError "shibuya-kiroku-adapter"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "keiro-bench" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
            (hsPkgs."hs-opentelemetry-sdk" or (errorHandler.buildDepError "hs-opentelemetry-sdk"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }