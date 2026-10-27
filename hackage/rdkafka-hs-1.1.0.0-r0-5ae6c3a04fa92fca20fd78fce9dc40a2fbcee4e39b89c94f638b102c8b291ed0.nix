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
    flags = { examples = false; integration = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "rdkafka-hs"; version = "1.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Nadeem Bitar <nadeem@gmail.com>";
      author = "Alexey Raga <alexey.raga@gmail.com>";
      homepage = "https://github.com/shinzui/rdkafka-hs";
      url = "";
      synopsis = "Kafka bindings for Haskell backed by librdkafka";
      description = "Apache Kafka bindings backed by the librdkafka C library.\n\nrdkafka-hs is the maintained successor of hw-kafka-client and keeps\nits Kafka.* module namespace.\n\nFeatures include:\n\n* Consumer groups: auto-rebalancing consumers\n\n* Keyed and keyless messages producing/consuming\n\n* Batch producing messages";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
        ];
        libs = [ (pkgs."rdkafka" or (errorHandler.sysDepError "rdkafka")) ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.c2hs.components.exes.c2hs or (pkgs.pkgsBuildBuild.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
        ];
        buildable = true;
      };
      exes = {
        "kafka-client-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."rdkafka-hs" or (errorHandler.buildDepError "rdkafka-hs"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.examples then false else true;
        };
      };
      tests = {
        "rdkafka-hs-integration" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."rdkafka-hs" or (errorHandler.buildDepError "rdkafka-hs"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          libs = pkgs.lib.optional (system.isLinux) (pkgs."dl" or (errorHandler.sysDepError "dl"));
          buildable = if !flags.integration then false else true;
        };
        "rdkafka-hs-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."rdkafka-hs" or (errorHandler.buildDepError "rdkafka-hs"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }