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
      identifier = { name = "agentic-io"; version = "0.2.1.0"; };
      license = "BSD-2-Clause";
      copyright = "2026 Tom Wells";
      maintainer = "drshade@gmail.com";
      author = "Tom Wells";
      homepage = "https://github.com/drshade/haskell-agentic";
      url = "";
      synopsis = "IO helpers for agentic runtimes: concurrency, recording and replay";
      description = "Runs a flow's independent work concurrently, records model calls to a file and replays them, and loads provider keys from a .env file.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
          (hsPkgs."agentic-aeson" or (errorHandler.buildDepError "agentic-aeson"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
        ];
        buildable = true;
      };
      tests = {
        "agentic-io-test" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."agentic-io" or (errorHandler.buildDepError "agentic-io"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }