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
      specVersion = "1.10";
      identifier = { name = "copilot-theorem"; version = "4.8.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ivan Perez <ivan.perezdominguez@nasa.gov>";
      author = "Jonathan Laurent";
      homepage = "https://copilot-language.github.io";
      url = "";
      synopsis = "k-induction for Copilot.";
      description = "Some tools to prove properties on Copilot programs with k-induction model\nchecking.\n\nCopilot is a stream (i.e., infinite lists) domain-specific language (DSL) in\nHaskell that compiles into embedded C.  Copilot contains an interpreter,\nmultiple back-end compilers, and other verification tools.\n\nA tutorial, examples, and other information are available at\n<https://copilot-language.github.io>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bimap" or (errorHandler.buildDepError "bimap"))
          (hsPkgs."bv-sized" or (errorHandler.buildDepError "bv-sized"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          (hsPkgs."fp-ieee" or (errorHandler.buildDepError "fp-ieee"))
          (hsPkgs."libBF" or (errorHandler.buildDepError "libBF"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."panic" or (errorHandler.buildDepError "panic"))
          (hsPkgs."parameterized-utils" or (errorHandler.buildDepError "parameterized-utils"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."what4" or (errorHandler.buildDepError "what4"))
          (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
          (hsPkgs."copilot-prettyprinter" or (errorHandler.buildDepError "copilot-prettyprinter"))
        ];
        buildable = true;
      };
      tests = {
        "unit-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = true;
        };
      };
    };
  }