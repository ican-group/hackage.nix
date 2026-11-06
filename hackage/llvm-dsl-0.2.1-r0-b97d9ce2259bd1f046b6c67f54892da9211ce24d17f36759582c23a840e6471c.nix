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
    flags = { debug = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "llvm-dsl"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "https://wiki.haskell.org/LLVM";
      url = "";
      synopsis = "Support for writing an EDSL with LLVM-JIT as target";
      description = "Support for writing an EDSL with LLVM-JIT as target.\n\n* \"LLVM.DSL.Expression\":\nCode snippets that represent arithmetics\nand support arithmetic operators.\n\n* \"LLVM.DSL.Parameter\":\nParameterize LLVM-generated code.\n\n* \"LLVM.DSL.Execution\":\nAssemble functions to modules and run them.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."llvm-extra" or (errorHandler.buildDepError "llvm-extra"))
          (hsPkgs."llvm-tf" or (errorHandler.buildDepError "llvm-tf"))
          (hsPkgs."tfp" or (errorHandler.buildDepError "tfp"))
          (hsPkgs."numeric-prelude" or (errorHandler.buildDepError "numeric-prelude"))
          (hsPkgs."storable-record" or (errorHandler.buildDepError "storable-record"))
          (hsPkgs."storable-enum" or (errorHandler.buildDepError "storable-enum"))
          (hsPkgs."bool8" or (errorHandler.buildDepError "bool8"))
          (hsPkgs."vault" or (errorHandler.buildDepError "vault"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
          (hsPkgs."unsafe" or (errorHandler.buildDepError "unsafe"))
          (hsPkgs."prelude-compat" or (errorHandler.buildDepError "prelude-compat"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
        ];
        buildable = true;
      };
      tests = {
        "llvm-dsl-test" = {
          depends = [
            (hsPkgs."doctest-exitcode-stdio" or (errorHandler.buildDepError "doctest-exitcode-stdio"))
            (hsPkgs."doctest-lib" or (errorHandler.buildDepError "doctest-lib"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."llvm-dsl" or (errorHandler.buildDepError "llvm-dsl"))
            (hsPkgs."llvm-extra" or (errorHandler.buildDepError "llvm-extra"))
            (hsPkgs."llvm-tf" or (errorHandler.buildDepError "llvm-tf"))
            (hsPkgs."tfp" or (errorHandler.buildDepError "tfp"))
            (hsPkgs."non-empty" or (errorHandler.buildDepError "non-empty"))
            (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
          buildable = true;
        };
      };
    };
  }