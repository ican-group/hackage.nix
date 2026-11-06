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
      identifier = { name = "shomei-client"; version = "0.3.0.0"; };
      license = "MIT";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/shomei";
      url = "";
      synopsis = "Haskell client for the standalone Shōmei auth service";
      description = "A typed Haskell client derived from the same ShomeiAPI definition that\nshomei-servant serves, so the client and the server cannot drift apart.\nWraps the generated servant-client functions in a small record with\nconnection management and token handling for calling a standalone\nshomei-server from another service.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64" or (errorHandler.buildDepError "base64"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."http-api-data" or (errorHandler.buildDepError "http-api-data"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
          (hsPkgs."servant-client" or (errorHandler.buildDepError "servant-client"))
          (hsPkgs."servant-client-core" or (errorHandler.buildDepError "servant-client-core"))
          (hsPkgs."servant-health" or (errorHandler.buildDepError "servant-health"))
          (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
          (hsPkgs."shomei-servant" or (errorHandler.buildDepError "shomei-servant"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "shomei-client-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."servant-client" or (errorHandler.buildDepError "servant-client"))
            (hsPkgs."servant-health" or (errorHandler.buildDepError "servant-health"))
            (hsPkgs."shomei-client" or (errorHandler.buildDepError "shomei-client"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
            (hsPkgs."shomei-migrations".components.sublibs.test-support or (errorHandler.buildDepError "shomei-migrations:test-support"))
            (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
            (hsPkgs."shomei-servant" or (errorHandler.buildDepError "shomei-servant"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ];
          buildable = true;
        };
      };
    };
  }