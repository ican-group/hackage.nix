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
      specVersion = "1.12";
      identifier = { name = "PenroseKiteDart"; version = "1.11"; };
      license = "BSD-3-Clause";
      copyright = "2021 Chris Reade";
      maintainer = "chrisreade@mac.com";
      author = "Chris Reade";
      homepage = "https://github.com/chrisreade/PenroseKiteDart#readme";
      url = "";
      synopsis = "Library to explore Penrose's Kite and Dart Tilings.";
      description = "Library to explore Penrose's Kite and Dart Tilings using Haskell Diagrams. Please see README.md";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."diagrams-lib" or (errorHandler.buildDepError "diagrams-lib"))
        ];
        buildable = true;
      };
      tests = {
        "PenroseKiteDart-test" = {
          depends = [
            (hsPkgs."PenroseKiteDart" or (errorHandler.buildDepError "PenroseKiteDart"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."diagrams-lib" or (errorHandler.buildDepError "diagrams-lib"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "PenroseKiteDart-bench" = {
          depends = [
            (hsPkgs."PenroseKiteDart" or (errorHandler.buildDepError "PenroseKiteDart"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."diagrams-lib" or (errorHandler.buildDepError "diagrams-lib"))
          ];
          buildable = true;
        };
      };
    };
  }