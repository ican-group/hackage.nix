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
      specVersion = "1.10";
      identifier = { name = "h3spec"; version = "0.1.15"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "kazu@iij.ad.jp";
      author = "Kazu Yamamoto";
      homepage = "";
      url = "";
      synopsis = "QUIC";
      description = "Test tool for error cases of QUIC and HTTP/3";
      buildType = "Simple";
    };
    components = {
      exes = {
        "h3spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."http3" or (errorHandler.buildDepError "http3"))
            (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          ];
          buildable = true;
        };
      };
    };
  }