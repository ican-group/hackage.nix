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
    flags = { blas = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "proarrow"; version = "0.4.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "sjoerd@w3future.com";
      author = "Sjoerd Visscher";
      homepage = "https://github.com/sjoerdvisscher/proarrow";
      url = "";
      synopsis = "Category theory with a central role for profunctors";
      description = "A library for doing category theory in Haskell with profunctors, rather\nthan functors, as the central abstraction. Every Haskell kind carries at\nmost one category structure (chosen via @CategoryOf@), newtype wrappers on\nkinds give variant categories, and functors are encoded as representable\nprofunctors. On top of this the library provides monoidal structure,\n(co)limits, adjunctions, Kan extensions, promonads, and a full\nprofunctor-optics hierarchy.\n.\nImport \"Proarrow\" to get started; \"Proarrow.Core\" explains the design of the\ncore abstractions in depth. The public sublibrary @proarrow:testing@ provides\ngeneric law-checking properties for testing your own categories. ";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."fin" or (errorHandler.buildDepError "fin"))
          (hsPkgs."vec" or (errorHandler.buildDepError "vec"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."universe-base" or (errorHandler.buildDepError "universe-base"))
        ];
        libs = pkgs.lib.optionals (flags.blas) (pkgs.lib.optional (!system.isOsx) (pkgs."openblas" or (errorHandler.sysDepError "openblas")));
        frameworks = pkgs.lib.optionals (flags.blas) (pkgs.lib.optional (system.isOsx) (pkgs."Accelerate" or (errorHandler.sysDepError "Accelerate")));
        buildable = true;
      };
      sublibs = {
        "testing" = {
          depends = [
            (hsPkgs."proarrow" or (errorHandler.buildDepError "proarrow"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."falsify" or (errorHandler.buildDepError "falsify"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-falsify" or (errorHandler.buildDepError "tasty-falsify"))
          ];
          buildable = true;
        };
      };
      exes = {
        "smc-audio" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."proarrow" or (errorHandler.buildDepError "proarrow"))
            (hsPkgs."WAVE" or (errorHandler.buildDepError "WAVE"))
            (hsPkgs."Yampa" or (errorHandler.buildDepError "Yampa"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."proarrow" or (errorHandler.buildDepError "proarrow"))
            (hsPkgs."proarrow".components.sublibs.testing or (errorHandler.buildDepError "proarrow:testing"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."falsify" or (errorHandler.buildDepError "falsify"))
            (hsPkgs."fin" or (errorHandler.buildDepError "fin"))
            (hsPkgs."vec" or (errorHandler.buildDepError "vec"))
            (hsPkgs."universe-base" or (errorHandler.buildDepError "universe-base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-falsify" or (errorHandler.buildDepError "tasty-falsify"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."Yampa" or (errorHandler.buildDepError "Yampa"))
          ];
          buildable = true;
        };
      };
    };
  }