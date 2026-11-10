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
      identifier = { name = "pubgrub-cabal"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Tweag I/O by Modus Create";
      maintainer = "andrea.bedini@moduscreate.com";
      author = "Andrea Bedini";
      homepage = "https://github.com/tweag/pubgrub-hs";
      url = "";
      synopsis = "The PubGrub version solver for cabal packages";
      description = "The cabal domain for the @pubgrub@ solver: a package name or one of its\nautomatic flags is a variable, an installed unit or a source release is a\nvalue, a dependency's declared range is one symbolic set of instances, and\nthe leaves of every proof are what the request asks for, what a @.cabal@\nfile states, and what the compiler and the machine rule out.\n\nIt provides the translation from @GenericPackageDescription@ and an\ninstalled package set into the solver's input (@PubGrub.Cabal.Flatten@,\n@PubGrub.Cabal.Installed@), the rule that picks an instance of a package\nand states what it entails (@PubGrub.Cabal.Provider@), and the renderer\nthat prints a failed resolution as a proof in cabal's range syntax\n(@PubGrub.Cabal.Report@). Of the cabal ecosystem it needs @Cabal-syntax@\nonly: the index, the compiler and the installed database are the caller's\nto supply.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Cabal-syntax" or (errorHandler.buildDepError "Cabal-syntax"))
          (hsPkgs."co-log-core" or (errorHandler.buildDepError "co-log-core"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."pubgrub" or (errorHandler.buildDepError "pubgrub"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "pubgrub-cabal-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal-syntax" or (errorHandler.buildDepError "Cabal-syntax"))
            (hsPkgs."co-log-core" or (errorHandler.buildDepError "co-log-core"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."pubgrub" or (errorHandler.buildDepError "pubgrub"))
            (hsPkgs."pubgrub-cabal" or (errorHandler.buildDepError "pubgrub-cabal"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }