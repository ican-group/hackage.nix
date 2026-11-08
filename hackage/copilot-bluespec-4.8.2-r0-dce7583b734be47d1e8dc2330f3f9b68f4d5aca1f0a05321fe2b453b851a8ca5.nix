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
    flags = { test-bluespec = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "copilot-bluespec"; version = "4.8.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ryan Scott <rscott@galois.com>";
      author = "Frank Dedden\n, Alwyn Goodloe\n, Ivan Perez\n, Ryan Scott";
      homepage = "https://copilot-language.github.io";
      url = "";
      synopsis = "A compiler for Copilot targeting FPGAs.";
      description = "This package is a back-end from Copilot to FPGAs in Bluespec.\n\nCopilot is a stream (i.e., infinite lists) domain-specific language (DSL) in\nHaskell. Copilot contains an interpreter, multiple back-end compilers, and\nother verification tools.\n\nA tutorial, examples, and other information are available at\n<https://copilot-language.github.io>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."fp-ieee" or (errorHandler.buildDepError "fp-ieee"))
          (hsPkgs."ieee754" or (errorHandler.buildDepError "ieee754"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
          (hsPkgs."language-bluespec" or (errorHandler.buildDepError "language-bluespec"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ieee754" or (errorHandler.buildDepError "ieee754"))
            (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
            (hsPkgs."copilot-bluespec" or (errorHandler.buildDepError "copilot-bluespec"))
          ];
          buildable = if flags.test-bluespec then true else false;
        };
      };
    };
  }