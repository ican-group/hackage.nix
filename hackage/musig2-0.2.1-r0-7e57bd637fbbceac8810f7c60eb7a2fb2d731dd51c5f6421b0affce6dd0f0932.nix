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
      identifier = { name = "musig2"; version = "0.2.1"; };
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
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."entropy" or (errorHandler.buildDepError "entropy"))
          (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          (hsPkgs."ppad-sha256" or (errorHandler.buildDepError "ppad-sha256"))
        ];
        buildable = true;
      };
      tests = {
        "musig2-tests" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."entropy" or (errorHandler.buildDepError "entropy"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
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
        "musig2-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."musig2" or (errorHandler.buildDepError "musig2"))
            (hsPkgs."ppad-secp256k1" or (errorHandler.buildDepError "ppad-secp256k1"))
          ];
          buildable = true;
        };
      };
    };
  }