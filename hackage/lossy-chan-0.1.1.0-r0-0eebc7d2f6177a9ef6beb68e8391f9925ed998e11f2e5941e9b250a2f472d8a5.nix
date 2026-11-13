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
    flags = { small-loop-counter = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "lossy-chan"; version = "0.1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Well-Typed";
      maintainer = "wen@well-typed.com";
      author = "Wen Kokke";
      homepage = "";
      url = "";
      synopsis = "Fast, bounded, and lossy broadcast channels backed by a ring buffer";
      description = "Fast, bounded, and /lossy/ broadcast channels backed by a ring buffer.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
      tests = {
        "lossy-chan-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lossy-chan" or (errorHandler.buildDepError "lossy-chan"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "lossy-chan-benchmark-time" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."lossy-chan" or (errorHandler.buildDepError "lossy-chan"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."unagi-chan" or (errorHandler.buildDepError "unagi-chan"))
          ];
          buildable = true;
        };
        "lossy-chan-benchmark-space" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lossy-chan" or (errorHandler.buildDepError "lossy-chan"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."unagi-chan" or (errorHandler.buildDepError "unagi-chan"))
            (hsPkgs."weigh" or (errorHandler.buildDepError "weigh"))
          ];
          buildable = true;
        };
      };
    };
  }