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
      identifier = { name = "ppad-eproc"; version = "0.5.3"; };
      license = "MIT";
      copyright = "";
      maintainer = "jared@ppad.tech";
      author = "Jared Tobin";
      homepage = "";
      url = "";
      synopsis = "Anytime-valid sequential testing via e-processes.";
      description = "Anytime-valid sequential hypothesis testing and estimation for\nbounded random variables, via the e-process / betting framework of\nWaudby-Smith and Ramdas (2024). Provides bounded-mean, paired\ntwo-sample, and one- and two-sided Bernoulli rate tests with fixed,\nadaptive (aGRAPA), and online Newton bettors; anytime-valid p-values\nand e-values; uniform convex mixtures of e-processes; and\ntime-uniform confidence sequences for bounded means.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
      tests = {
        "eproc-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ppad-eproc" or (errorHandler.buildDepError "ppad-eproc"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "eproc-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-eproc" or (errorHandler.buildDepError "ppad-eproc"))
          ];
          buildable = true;
        };
        "eproc-weigh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-eproc" or (errorHandler.buildDepError "ppad-eproc"))
            (hsPkgs."weigh" or (errorHandler.buildDepError "weigh"))
          ];
          buildable = true;
        };
      };
    };
  }