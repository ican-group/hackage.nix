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
      identifier = { name = "langchain-hs-mcp"; version = "0.0.6.2"; };
      license = "MIT";
      copyright = "2025-2026 Tushar Adhatrao";
      maintainer = "tusharadhatrao@gmail.com";
      author = "Tushar Adhatrao";
      homepage = "https://github.com/tusharad/langchain-hs#readme";
      url = "";
      synopsis = "Model Context Protocol (MCP) client for langchain-hs";
      description = "First-class MCP JSON-RPC 2.0 client supporting stdio and HTTP transports. Enables Haskell agents to discover and call tools published by any MCP server (e.g. Hackage docs, SQLite, filesystem, GitHub). Depends only on langchain-hs-core; no provider-specific dependencies.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
          (hsPkgs."langchain-hs-core" or (errorHandler.buildDepError "langchain-hs-core"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "langchain-hs-mcp-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
            (hsPkgs."langchain-hs-core" or (errorHandler.buildDepError "langchain-hs-core"))
            (hsPkgs."langchain-hs-mcp" or (errorHandler.buildDepError "langchain-hs-mcp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }