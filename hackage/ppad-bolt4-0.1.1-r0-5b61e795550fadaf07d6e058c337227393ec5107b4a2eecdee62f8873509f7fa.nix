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
      identifier = { name = "ppad-bolt4"; version = "0.1.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "jared@ppad.tech";
      author = "Jared Tobin";
      homepage = "";
      url = "";
      synopsis = "Onion routing per BOLT #4";
      description = "Onion routing for the Lightning Network, per BOLT #4\n(<https://github.com/lightning/bolts/blob/master/04-onion-routing.md>):\nonion construction and processing, returning errors, and route\nblinding.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ppad-aead" or (errorHandler.buildDepError "ppad-aead"))
          (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
          (hsPkgs."ppad-bolt9" or (errorHandler.buildDepError "ppad-bolt9"))
          (hsPkgs."ppad-chacha" or (errorHandler.buildDepError "ppad-chacha"))
          (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
          (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
        ];
        buildable = true;
      };
      tests = {
        "bolt4-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
            (hsPkgs."ppad-bolt4" or (errorHandler.buildDepError "ppad-bolt4"))
            (hsPkgs."ppad-bolt9" or (errorHandler.buildDepError "ppad-bolt9"))
            (hsPkgs."ppad-chacha" or (errorHandler.buildDepError "ppad-chacha"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "bolt4-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
            (hsPkgs."ppad-bolt4" or (errorHandler.buildDepError "ppad-bolt4"))
          ];
          buildable = true;
        };
        "bolt4-weigh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
            (hsPkgs."ppad-bolt4" or (errorHandler.buildDepError "ppad-bolt4"))
            (hsPkgs."weigh" or (errorHandler.buildDepError "weigh"))
          ];
          buildable = true;
        };
      };
    };
  }