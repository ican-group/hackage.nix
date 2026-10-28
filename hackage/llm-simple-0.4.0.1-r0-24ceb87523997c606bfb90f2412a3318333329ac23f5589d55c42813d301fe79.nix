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
      identifier = { name = "llm-simple"; version = "0.4.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "1515314+aische@users.noreply.github.com";
      author = "Daniel van den Eijkel";
      homepage = "https://github.com/aische/llm-simple#readme";
      url = "";
      synopsis = "Multi-provider LLM library with agent tool loops and filesystem tools";
      description = "Experimental Haskell library for talking to LLMs.\n.\nFeatures multi-provider gateways (OpenAI, Claude, Gemini, Ollama, DeepSeek),\nsingle-shot text/stream/object generation with model fallbacks, agent tool\nloops, structured output via Autodocodec, JSON model- and provider-catalog\nloading, and workspace-scoped filesystem tools.\n.\nStatus: pre-1.0 — APIs may change between major versions.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
          (hsPkgs."autodocodec" or (errorHandler.buildDepError "autodocodec"))
          (hsPkgs."autodocodec-schema" or (errorHandler.buildDepError "autodocodec-schema"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."dotenv" or (errorHandler.buildDepError "dotenv"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."req" or (errorHandler.buildDepError "req"))
          (hsPkgs."retry" or (errorHandler.buildDepError "retry"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      exes = {
        "llm-simple" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."autodocodec" or (errorHandler.buildDepError "autodocodec"))
            (hsPkgs."autodocodec-schema" or (errorHandler.buildDepError "autodocodec-schema"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dotenv" or (errorHandler.buildDepError "dotenv"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."heptapod" or (errorHandler.buildDepError "heptapod"))
            (hsPkgs."llm-simple" or (errorHandler.buildDepError "llm-simple"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."retry" or (errorHandler.buildDepError "retry"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "record-conversation" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."autodocodec" or (errorHandler.buildDepError "autodocodec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dotenv" or (errorHandler.buildDepError "dotenv"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."heptapod" or (errorHandler.buildDepError "heptapod"))
            (hsPkgs."llm-simple" or (errorHandler.buildDepError "llm-simple"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "llm-simple-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."autodocodec" or (errorHandler.buildDepError "autodocodec"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."heptapod" or (errorHandler.buildDepError "heptapod"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."llm-simple" or (errorHandler.buildDepError "llm-simple"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."req" or (errorHandler.buildDepError "req"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."retry" or (errorHandler.buildDepError "retry"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }