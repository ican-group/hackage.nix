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
    flags = {
      llvm = false;
      validate = false;
      run = false;
      integration = false;
    };
    package = {
      specVersion = "3.0";
      identifier = { name = "ppad-censor"; version = "0.6.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "jared@ppad.tech";
      author = "Jared Tobin";
      homepage = "";
      url = "";
      synopsis = "Anytime-valid sequential constant-time testing.";
      description = "A pure Haskell framework for sequential constant-time testing via\nanytime-valid e-processes.\n\nDeclare a constant-time hypothesis (an @IO@ action plus two input\nsamplers); the driver times the action on paired inputs from the two\nclasses, in random order, and tests them with a hedged mixture of\nppad-eproc e-processes, halting as soon as the evidence suffices.\n\nProvides dudect-style fix-vs-random hypotheses, A\\/A and B\\/B negative\ncontrols, wall-clock and Linux hardware-counter meters, foreign\ntargets via FFI or a dlopen CLI, and anytime-valid p-values and\neffect-size intervals.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."ppad-eproc" or (errorHandler.buildDepError "ppad-eproc"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
        ];
        libs = pkgs.lib.optional (system.isLinux) (pkgs."dl" or (errorHandler.sysDepError "dl"));
        buildable = true;
      };
      exes = {
        "censor-validate" = {
          depends = pkgs.lib.optionals (!!flags.validate) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ppad-censor" or (errorHandler.buildDepError "ppad-censor"))
          ];
          buildable = if !flags.validate then false else true;
        };
        "censor" = {
          depends = pkgs.lib.optionals (!!flags.run) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ppad-censor" or (errorHandler.buildDepError "ppad-censor"))
          ];
          buildable = if !flags.run then false else true;
        };
      };
      tests = {
        "censor-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ppad-censor" or (errorHandler.buildDepError "ppad-censor"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
        "censor-integration" = {
          depends = pkgs.lib.optionals (!(!flags.integration || system.isWindows)) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ppad-censor" or (errorHandler.buildDepError "ppad-censor"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = if !flags.integration || system.isWindows
            then false
            else true;
        };
      };
      benchmarks = {
        "censor-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-censor" or (errorHandler.buildDepError "ppad-censor"))
          ];
          buildable = true;
        };
        "censor-weigh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ppad-censor" or (errorHandler.buildDepError "ppad-censor"))
            (hsPkgs."weigh" or (errorHandler.buildDepError "weigh"))
          ];
          buildable = true;
        };
      };
    };
  }