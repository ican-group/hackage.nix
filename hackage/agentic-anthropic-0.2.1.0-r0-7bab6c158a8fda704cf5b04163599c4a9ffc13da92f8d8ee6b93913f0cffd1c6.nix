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
      identifier = { name = "agentic-anthropic"; version = "0.2.1.0"; };
      license = "BSD-2-Clause";
      copyright = "2026 Tom Wells";
      maintainer = "drshade@gmail.com";
      author = "Tom Wells";
      homepage = "https://github.com/drshade/haskell-agentic";
      url = "";
      synopsis = "Claude as the System Two provider for agentic";
      description = "Runs agentic's draft steps on Claude through the Messages API, with strict structured outputs and tools, and can stand in as System One.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
          (hsPkgs."agentic-aeson" or (errorHandler.buildDepError "agentic-aeson"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "agentic-anthropic-test" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."agentic-aeson" or (errorHandler.buildDepError "agentic-aeson"))
            (hsPkgs."agentic-anthropic" or (errorHandler.buildDepError "agentic-anthropic"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "agentic-anthropic-live" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."agentic-anthropic" or (errorHandler.buildDepError "agentic-anthropic"))
            (hsPkgs."agentic-io" or (errorHandler.buildDepError "agentic-io"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }