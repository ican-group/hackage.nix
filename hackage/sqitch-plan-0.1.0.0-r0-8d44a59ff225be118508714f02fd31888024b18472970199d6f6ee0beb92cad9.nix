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
      identifier = { name = "sqitch-plan"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2026 Kronor";
      maintainer = "lorenzo@kronor.io";
      author = "José Lorenzo Rodríguez";
      homepage = "https://github.com/kronor-io/sqitch-plan";
      url = "";
      synopsis = "Parse and render sqitch.plan files";
      description = "A parser and renderer for the plan files of\n<https://sqitch.org sqitch>, the database change manager. It reads the\nwhole format (pragmas, changes with dependencies, tags, notes, comments\nand reworks), keeps each entry's line number, and writes a parsed plan\nback byte for byte.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      tests = {
        "sqitch-plan-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."sqitch-plan" or (errorHandler.buildDepError "sqitch-plan"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (errorHandler.buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
      };
    };
  }