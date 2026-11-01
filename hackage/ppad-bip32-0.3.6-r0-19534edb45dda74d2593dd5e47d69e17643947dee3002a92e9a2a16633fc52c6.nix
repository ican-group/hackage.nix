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
      identifier = { name = "ppad-bip32"; version = "0.3.6"; };
      license = "MIT";
      copyright = "";
      maintainer = "jared@ppad.tech";
      author = "Jared Tobin";
      homepage = "";
      url = "";
      synopsis = "BIP32 hierarchical deterministic wallets.";
      description = "[BIP32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)\nhierarchical deterministic wallets and extended keys, with support for\nserialization and parsing.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."ppad-base58" or (errorHandler.buildDepError "ppad-base58"))
          (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
          (hsPkgs."ppad-ripemd160" or (errorHandler.buildDepError "ppad-ripemd160"))
          (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
          (hsPkgs."ppad-sha512" or (errorHandler.buildDepError "ppad-sha512"))
        ];
        buildable = true;
      };
      tests = {
        "bip32-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ppad-base16" or (errorHandler.buildDepError "ppad-base16"))
            (hsPkgs."ppad-base58" or (errorHandler.buildDepError "ppad-base58"))
            (hsPkgs."ppad-bip32" or (errorHandler.buildDepError "ppad-bip32"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "bip32-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-bip32" or (errorHandler.buildDepError "ppad-bip32"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          ];
          buildable = true;
        };
      };
    };
  }