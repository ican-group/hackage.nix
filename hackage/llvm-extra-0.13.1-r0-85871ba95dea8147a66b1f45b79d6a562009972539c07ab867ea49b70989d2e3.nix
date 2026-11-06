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
    flags = { buildexamples = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "llvm-extra"; version = "0.13.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "https://wiki.haskell.org/LLVM";
      url = "";
      synopsis = "Utility functions for the llvm interface";
      description = "The Low-Level Virtual-Machine is a compiler back-end with optimizer.\nYou may also call it a high-level portable assembler.\nThis package provides various utility functions\nfor the Haskell interface to LLVM, for example:\n\n* arithmetic operations with more general types\nbut better type inference than the @llvm@ interface\nin \"LLVM.Extra.Arithmetic\",\n\n* a type class for loading and storing sets of values with one command (macro)\nin \"LLVM.Extra.Memory\",\n\n* storing and reading Haskell values in an LLVM compatible format\nin \"LLVM.Extra.Marshal\",\n\n* LLVM functions for loading and storing values in Haskell's @Storable@ format\nin \"LLVM.Extra.Storable\",\n\n* support value tuples and instance declarations of LLVM classes\nin \"LLVM.Extra.Tuple\",\n\n* handling of termination by a custom monad on top of @CodeGenFunction@\nin \"LLVM.Extra.MaybeContinuation\"\n\n* various kinds of loops (while) and condition structures (if-then-else)\nin \"LLVM.Extra.Control\"\n\n* more functional loop construction using \"LLVM.Extra.Iterator\"\n\n* complex Haskell values mapped to LLVM values in \"LLVM.Extra.Nice.Value\"\n\n* advanced vector operations\nsuch as sum of all vector elements, cumulative sum,\nfloor, non-negative fraction, absolute value\nin \"LLVM.Extra.Vector\"\n\n* type classes for handling scalar and vector operations\nin a uniform way\nin \"LLVM.Extra.ScalarOrVector\"";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."llvm-extra".components.sublibs.private or (errorHandler.buildDepError "llvm-extra:private"))
          (hsPkgs."llvm-tf" or (errorHandler.buildDepError "llvm-tf"))
          (hsPkgs."tfp" or (errorHandler.buildDepError "tfp"))
          (hsPkgs."non-empty" or (errorHandler.buildDepError "non-empty"))
          (hsPkgs."fixed-length" or (errorHandler.buildDepError "fixed-length"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."enumset" or (errorHandler.buildDepError "enumset"))
          (hsPkgs."storable-record" or (errorHandler.buildDepError "storable-record"))
          (hsPkgs."storable-enum" or (errorHandler.buildDepError "storable-enum"))
          (hsPkgs."bool8" or (errorHandler.buildDepError "bool8"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
          (hsPkgs."prelude-compat" or (errorHandler.buildDepError "prelude-compat"))
          (hsPkgs."base-orphans" or (errorHandler.buildDepError "base-orphans"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
        ];
        buildable = true;
      };
      sublibs = {
        "private" = {
          depends = [
            (hsPkgs."llvm-tf" or (errorHandler.buildDepError "llvm-tf"))
            (hsPkgs."tfp" or (errorHandler.buildDepError "tfp"))
            (hsPkgs."non-empty" or (errorHandler.buildDepError "non-empty"))
            (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
          buildable = true;
        };
      };
      exes = {
        "tone-llvm" = {
          depends = pkgs.lib.optionals (flags.buildexamples) [
            (hsPkgs."llvm-extra" or (errorHandler.buildDepError "llvm-extra"))
            (hsPkgs."llvm-tf" or (errorHandler.buildDepError "llvm-tf"))
            (hsPkgs."tfp" or (errorHandler.buildDepError "tfp"))
            (hsPkgs."non-empty" or (errorHandler.buildDepError "non-empty"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
          buildable = if flags.buildexamples then true else false;
        };
      };
      tests = {
        "llvm-extra-test" = {
          depends = [
            (hsPkgs."doctest-exitcode-stdio" or (errorHandler.buildDepError "doctest-exitcode-stdio"))
            (hsPkgs."doctest-lib" or (errorHandler.buildDepError "doctest-lib"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."llvm-extra".components.sublibs.private or (errorHandler.buildDepError "llvm-extra:private"))
            (hsPkgs."llvm-extra" or (errorHandler.buildDepError "llvm-extra"))
            (hsPkgs."llvm-tf" or (errorHandler.buildDepError "llvm-tf"))
            (hsPkgs."tfp" or (errorHandler.buildDepError "tfp"))
            (hsPkgs."storable-record" or (errorHandler.buildDepError "storable-record"))
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