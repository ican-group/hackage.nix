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
      identifier = { name = "musig2"; version = "0.3.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "jose@storopoli.com";
      author = "Jose Storopoli";
      homepage = "https://github.com/storopoli/musig2";
      url = "";
      synopsis = "MuSig2 library";
      description = "Pure BIP0327 MuSig2 (partial)signatures with tweak support on the elliptic curve secp256k1.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."entropy" or (errorHandler.buildDepError "entropy"))
          (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
          (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
        ];
        buildable = true;
      };
      sublibs = {
        "internal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."entropy" or (errorHandler.buildDepError "entropy"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
          ];
          buildable = true;
        };
      };
      tests = {
        "musig2-tests" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."musig2".components.sublibs.internal or (errorHandler.buildDepError "musig2:internal"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
            (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "musig2-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."musig2".components.sublibs.internal or (errorHandler.buildDepError "musig2:internal"))
          ];
          buildable = true;
        };
      };
    };
  }