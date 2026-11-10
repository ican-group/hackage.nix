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
      identifier = { name = "probability-polynomial"; version = "1.0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "Predictable Network Solutions Ltd., 2020-2026";
      maintainer = "peter.thompson@pnsol.com";
      author = "Peter W. Thompson, Heinrich Apfelmus";
      homepage = "https://github.com/DeltaQ-SD/deltaq";
      url = "";
      synopsis = "Probability distributions via piecewise polynomials";
      description = "Package for manipulating finite probability distributions.\n\nBoth discrete, continuous and mixed probability distributions are supported.\nContinuous probability distributions are represented\nin terms of piecewise polynomials.\n\nAlso includes an implementation of polynomials in one variable.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."exact-combinatorics" or (errorHandler.buildDepError "exact-combinatorics"))
        ];
        buildable = true;
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."probability-polynomial" or (errorHandler.buildDepError "probability-polynomial"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "probability-polynomial-benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."probability-polynomial" or (errorHandler.buildDepError "probability-polynomial"))
          ];
          buildable = true;
        };
      };
    };
  }