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
      identifier = { name = "shomei-jwt"; version = "0.3.0.0"; };
      license = "MIT";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/shomei";
      url = "";
      synopsis = "JWT access-token signing/verification and JWKS publishing";
      description = "Interprets Shōmei's signing-key effects with jose. Signs and verifies ES256\n(or, configurably, RS256) access tokens and OpenID Connect ID tokens,\npublishes the JWKS document that relying services fetch to verify those\ntokens offline, and implements key rotation with an overlap window so a\nretired key keeps verifying outstanding tokens until they expire. Depends\nonly on shomei-core, so it can be used without Shōmei's HTTP or PostgreSQL\nlayers.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."monad-time" or (errorHandler.buildDepError "monad-time"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      tests = {
        "shomei-jwt-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
      };
    };
  }