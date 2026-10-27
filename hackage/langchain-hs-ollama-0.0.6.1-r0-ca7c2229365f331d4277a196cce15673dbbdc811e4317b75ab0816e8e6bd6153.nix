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
      specVersion = "1.12";
      identifier = { name = "langchain-hs-ollama"; version = "0.0.6.1"; };
      license = "MIT";
      copyright = "2025-2026 Tushar Adhatrao";
      maintainer = "tusharadhatrao@gmail.com";
      author = "Tushar Adhatrao";
      homepage = "https://github.com/tusharad/langchain-hs#readme";
      url = "";
      synopsis = "Ollama provider and embeddings for langchain-hs";
      description = "Ollama ChatModel provider and text embeddings integration for langchain-hs. Depends only on ollama-haskell; does not pull in OpenAI or Gemini dependencies.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."langchain-hs-core" or (errorHandler.buildDepError "langchain-hs-core"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."ollama-haskell" or (errorHandler.buildDepError "ollama-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "langchain-hs-ollama-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."langchain-hs-core" or (errorHandler.buildDepError "langchain-hs-core"))
            (hsPkgs."langchain-hs-ollama" or (errorHandler.buildDepError "langchain-hs-ollama"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."ollama-haskell" or (errorHandler.buildDepError "ollama-haskell"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }