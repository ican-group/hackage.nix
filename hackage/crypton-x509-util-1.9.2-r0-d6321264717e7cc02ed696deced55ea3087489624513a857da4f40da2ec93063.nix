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
      identifier = { name = "crypton-x509-util"; version = "1.9.2"; };
      license = "BSD-3-Clause";
      copyright = "Vincent Hanquez <vincent@snar.org>";
      maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
      author = "Vincent Hanquez <vincent@snarc.org>";
      homepage = "https://github.com/kazu-yamamoto/crypton-certificate";
      url = "";
      synopsis = "Utility for X509 certificate and chain";
      description = "utility to parse, show, validate, sign and produce X509 certificates and chain.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "crypton-x509-util" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."crypton-asn1-encoding" or (errorHandler.buildDepError "crypton-asn1-encoding"))
            (hsPkgs."crypton-asn1-types" or (errorHandler.buildDepError "crypton-asn1-types"))
            (hsPkgs."crypton-pem" or (errorHandler.buildDepError "crypton-pem"))
            (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
            (hsPkgs."crypton-x509-store" or (errorHandler.buildDepError "crypton-x509-store"))
            (hsPkgs."crypton-x509-system" or (errorHandler.buildDepError "crypton-x509-system"))
            (hsPkgs."crypton-x509-validation" or (errorHandler.buildDepError "crypton-x509-validation"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."time-hourglass" or (errorHandler.buildDepError "time-hourglass"))
          ];
          buildable = true;
        };
      };
    };
  }