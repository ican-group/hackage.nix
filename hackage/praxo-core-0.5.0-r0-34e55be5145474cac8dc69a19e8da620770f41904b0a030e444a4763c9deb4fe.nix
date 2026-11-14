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
      specVersion = "2.4";
      identifier = { name = "praxo-core"; version = "0.5.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "AxisVela <releases@axisvela.com>";
      author = "AxisVela";
      homepage = "https://axisvela.github.io/praxo-core/";
      url = "";
      synopsis = "Embeddable MIT-licensed agent framework for Haskell";
      description = "Native agent loop with tools, policy hooks, typed events, memory,\ncheckpoints, context budgets, middleware, JSON Schema validation,\nand plugin manifest parsing for the PRAXO-CORE agent framework.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      exes = {
        "praxo-haskell-conformance" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."praxo-core" or (errorHandler.buildDepError "praxo-core"))
          ];
          buildable = true;
        };
      };
      tests = {
        "wire-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."praxo-core" or (errorHandler.buildDepError "praxo-core"))
          ];
          buildable = true;
        };
      };
    };
  }