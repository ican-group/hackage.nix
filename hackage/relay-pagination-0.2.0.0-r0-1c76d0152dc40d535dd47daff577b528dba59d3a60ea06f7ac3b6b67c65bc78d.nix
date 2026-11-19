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
      identifier = { name = "relay-pagination"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Nadeem Bitar";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Relay-style cursor pagination wire types and opaque cursor codec";
      description = "Core wire types for Relay Cursor Connections-style pagination over REST:\nthe Connection/Edge/PageInfo response envelope with Relay-conventional JSON,\nfirst/after/last/before request validation, and a versioned, fingerprinted,\nbase64url-encoded opaque cursor with an exact, golden-tested wire format.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."http-api-data" or (errorHandler.buildDepError "http-api-data"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
        ];
        buildable = true;
      };
      tests = {
        "relay-pagination-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."http-api-data" or (errorHandler.buildDepError "http-api-data"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."relay-pagination" or (errorHandler.buildDepError "relay-pagination"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
          ];
          buildable = true;
        };
      };
    };
  }