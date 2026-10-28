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
      identifier = { name = "ppad-fixed"; version = "0.2.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "jared@ppad.tech";
      author = "Jared Tobin";
      homepage = "";
      url = "";
      synopsis = "Large fixed-width words and constant-time arithmetic.";
      description = "A pure high-performance implementation of large fixed-width integers\nand supporting constant-time operations, including Montgomery-form\narithmetic on domains related to the the elliptic curve secp256k1.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
        ];
        buildable = true;
      };
      tests = {
        "fixed-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "fixed-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
          ];
          buildable = true;
        };
        "fixed-weigh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-fixed" or (errorHandler.buildDepError "ppad-fixed"))
            (hsPkgs."weigh" or (errorHandler.buildDepError "weigh"))
          ];
          buildable = true;
        };
      };
    };
  }