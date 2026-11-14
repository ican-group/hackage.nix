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
      specVersion = "1.22";
      identifier = { name = "langchain-hs"; version = "0.0.6.2"; };
      license = "MIT";
      copyright = "2025-2026 Tushar Adhatrao";
      maintainer = "tusharadhatrao@gmail.com";
      author = "Tushar Adhatrao";
      homepage = "https://github.com/tusharad/langchain-hs#readme";
      url = "";
      synopsis = "Pure functional LLM agent framework and multi-agent graph engine in Haskell";
      description = "Build LLM-powered applications, ReAct agents, and LangGraph-style stateful workflows\nin Haskell. Provider-specific packages:\n- langchain-hs-ollama\n- langchain-hs-openai\n- langchain-hs-gemini\n- langchain-hs-mcp";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."langchain-hs-core" or (errorHandler.buildDepError "langchain-hs-core"))
          (hsPkgs."langchain-hs-graph" or (errorHandler.buildDepError "langchain-hs-graph"))
        ];
        buildable = true;
      };
      tests = {
        "langchain-hs-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."langchain-hs" or (errorHandler.buildDepError "langchain-hs"))
            (hsPkgs."langchain-hs-core" or (errorHandler.buildDepError "langchain-hs-core"))
            (hsPkgs."langchain-hs-graph" or (errorHandler.buildDepError "langchain-hs-graph"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }