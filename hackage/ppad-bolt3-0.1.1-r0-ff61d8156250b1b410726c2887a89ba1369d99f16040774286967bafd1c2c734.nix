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
      identifier = { name = "ppad-bolt3"; version = "0.1.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "jared@ppad.tech";
      author = "Jared Tobin";
      homepage = "";
      url = "";
      synopsis = "Bitcoin transaction formats per BOLT #3";
      description = "Bitcoin transaction and script formats for the Lightning Network, per\n[BOLT #3](https://github.com/lightning/bolts/blob/master/03-transactions.md).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
          (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
          (hsPkgs."ppad-ripemd160" or (errorHandler.buildDepError "ppad-ripemd160"))
          (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
          (hsPkgs."ppad-tx" or (errorHandler.buildDepError "ppad-tx"))
        ];
        buildable = true;
      };
      tests = {
        "bolt3-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
            (hsPkgs."ppad-bolt3" or (errorHandler.buildDepError "ppad-bolt3"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
            (hsPkgs."ppad-tx" or (errorHandler.buildDepError "ppad-tx"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "bolt3-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
            (hsPkgs."ppad-bolt3" or (errorHandler.buildDepError "ppad-bolt3"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
            (hsPkgs."ppad-tx" or (errorHandler.buildDepError "ppad-tx"))
          ];
          buildable = true;
        };
        "bolt3-weigh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-bolt1" or (errorHandler.buildDepError "ppad-bolt1"))
            (hsPkgs."ppad-bolt3" or (errorHandler.buildDepError "ppad-bolt3"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
            (hsPkgs."ppad-tx" or (errorHandler.buildDepError "ppad-tx"))
            (hsPkgs."weigh" or (errorHandler.buildDepError "weigh"))
          ];
          buildable = true;
        };
      };
    };
  }