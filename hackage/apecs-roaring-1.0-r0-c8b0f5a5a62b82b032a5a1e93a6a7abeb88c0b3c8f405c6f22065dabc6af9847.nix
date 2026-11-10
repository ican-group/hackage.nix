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
      identifier = { name = "apecs-roaring"; version = "1.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 IC Rainbow";
      maintainer = "aenor.realm@gmail.com";
      author = "IC Rainbow";
      homepage = "";
      url = "";
      synopsis = "Roaring bitmap stores for apecs";
      description = "Apecs stores for flag-like components backed by CRoaring 64-bit bitmaps.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."apecs" or (errorHandler.buildDepError "apecs"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."croaring-ffi" or (errorHandler.buildDepError "croaring-ffi"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "apecs-roaring-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."apecs" or (errorHandler.buildDepError "apecs"))
            (hsPkgs."apecs-roaring" or (errorHandler.buildDepError "apecs-roaring"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "apecs-roaring-bench" = {
          depends = [
            (hsPkgs."apecs" or (errorHandler.buildDepError "apecs"))
            (hsPkgs."apecs-roaring" or (errorHandler.buildDepError "apecs-roaring"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }