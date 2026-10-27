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
    flags = { devel = false; };
    package = {
      specVersion = "2.0";
      identifier = { name = "ech-config"; version = "0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "kazu@iij.ad.jp";
      author = "Kazu Yamamoto";
      homepage = "";
      url = "";
      synopsis = "Config for TLS Encrypted Client Hello";
      description = "Config types for TLS Encrypted Client Hello to glue DNS and TLS";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."network-byte-order" or (errorHandler.buildDepError "network-byte-order"))
        ];
        buildable = true;
      };
      exes = {
        "ech-gen" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
            (hsPkgs."ech-config" or (errorHandler.buildDepError "ech-config"))
            (hsPkgs."hpke" or (errorHandler.buildDepError "hpke"))
          ];
          buildable = if flags.devel then true else false;
        };
      };
    };
  }