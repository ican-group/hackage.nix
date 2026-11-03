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
      identifier = { name = "polytropos-mcp"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Model Context Protocol (MCP) server integration for polytropos";
      description = "Model Context Protocol (MCP) tool integration and JSON-RPC dispatch for\n<https://hackage.haskell.org/package/polytropos polytropos> open records and variants.\n\nSynthesizes MCP tool definitions and OpenAPI input schemas directly from\npolytropos open records, and dispatches tool execution requests to open variant\nhandlers with O(1) jump table elimination. Includes a stdio transport runner\nfor AI coding agents and language models.\n\nStart at the front door module \"Polytropos.MCP\" for protocol types,\ntool builders, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
          (hsPkgs."polytropos-aeson" or (errorHandler.buildDepError "polytropos-aeson"))
          (hsPkgs."polytropos-openapi3" or (errorHandler.buildDepError "polytropos-openapi3"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-mcp-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."polytropos-aeson" or (errorHandler.buildDepError "polytropos-aeson"))
            (hsPkgs."polytropos-openapi3" or (errorHandler.buildDepError "polytropos-openapi3"))
            (hsPkgs."polytropos-mcp" or (errorHandler.buildDepError "polytropos-mcp"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }