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
      identifier = { name = "agentic-jev"; version = "0.2.1.0"; };
      license = "BSD-2-Clause";
      copyright = "2026 Tom Wells";
      maintainer = "drshade@gmail.com";
      author = "Tom Wells";
      homepage = "https://github.com/drshade/haskell-agentic";
      url = "";
      synopsis = "Jev (TypeSafe) as the System One provider for agentic";
      description = "Answers agentic's judgements (yes/no, choice and score questions) with Jev, TypeSafe's System One model, which returns calibrated probabilities.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
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
        "agentic-jev-test" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."agentic-aeson" or (errorHandler.buildDepError "agentic-aeson"))
            (hsPkgs."agentic-jev" or (errorHandler.buildDepError "agentic-jev"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
        "agentic-jev-live" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."agentic-io" or (errorHandler.buildDepError "agentic-io"))
            (hsPkgs."agentic-jev" or (errorHandler.buildDepError "agentic-jev"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }