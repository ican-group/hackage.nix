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
      specVersion = "2.2";
      identifier = { name = "os-string"; version = "2.0.11"; };
      license = "BSD-3-Clause";
      copyright = "Julian Ospald 2021-2023";
      maintainer = "Julian Ospald <hasufell@posteo.de>";
      author = "Julian Ospald <hasufell@posteo.de>";
      homepage = "https://github.com/haskell/os-string/blob/master/README.md";
      url = "";
      synopsis = "Library for manipulating Operating system strings.";
      description = "This package provides functionality for manipulating @OsString@ values, and is shipped with <https://www.haskell.org/ghc/ GHC>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
        ] ++ (if compiler.isGhc && compiler.version.lt "9.14"
          then [
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ]
          else pkgs.lib.optionals (compiler.isGhc && true) [
            (hsPkgs."template-haskell-lift" or (errorHandler.buildDepError "template-haskell-lift"))
            (hsPkgs."template-haskell-quasiquoter" or (errorHandler.buildDepError "template-haskell-quasiquoter"))
          ]);
        buildable = true;
      };
      tests = {
        "bytestring-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
        "encoding-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-classes-base" or (errorHandler.buildDepError "quickcheck-classes-base"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
          ];
          buildable = true;
        };
      };
    };
  }