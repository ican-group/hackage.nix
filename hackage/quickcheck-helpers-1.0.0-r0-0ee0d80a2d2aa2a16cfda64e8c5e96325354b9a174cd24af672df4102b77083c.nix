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
      identifier = { name = "quickcheck-helpers"; version = "1.0.0"; };
      license = "MIT";
      copyright = "(C) MLabs 2026";
      maintainer = "koz@mlabs.city";
      author = "Koz Ross";
      homepage = "";
      url = "";
      synopsis = "Helpers for writing shrinkers.";
      description = "Provides a way to write shrinkers both concisely and easily, while\nnot sacrificing effectiveness.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-helpers" or (errorHandler.buildDepError "quickcheck-helpers"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-quickcheck-laws" or (errorHandler.buildDepError "tasty-quickcheck-laws"))
          ];
          buildable = true;
        };
      };
    };
  }