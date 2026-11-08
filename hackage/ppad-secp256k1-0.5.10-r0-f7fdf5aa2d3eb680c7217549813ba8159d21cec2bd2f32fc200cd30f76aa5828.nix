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
    flags = { llvm = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "ppad-secp256k1"; version = "0.5.10"; };
      license = "MIT";
      copyright = "";
      maintainer = "jared@ppad.tech";
      author = "Jared Tobin";
      homepage = "";
      url = "";
      synopsis = "Schnorr signatures, ECDSA, and ECDH on the elliptic curve\nsecp256k1";
      description = "Pure BIP0340-style Schnorr signatures, deterministic RFC6979 ECDSA, and\nECDH shared secret computation on the elliptic curve secp256k1.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."ppad-hmac-drbg" or (errorHandler.buildDepError "ppad-hmac-drbg"))
          (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
          (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
        ];
        buildable = true;
      };
      tests = {
        "secp256k1-tests" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "secp256k1-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          ];
          buildable = true;
        };
        "secp256k1-weigh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."weigh" or (errorHandler.buildDepError "weigh"))
          ];
          buildable = true;
        };
      };
    };
  }