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
      identifier = { name = "deltaq"; version = "1.2.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Predictable Network Solutions Ltd., 2003-2026\nPLWORKZ R&D, 2025";
      maintainer = "neil.davies@pnsol.com";
      author = "Neil Davies, Heinrich Apfelmus";
      homepage = "https://github.com/DeltaQ-SD/deltaq";
      url = "";
      synopsis = "Framework for ∆Q System Development";
      description = "∆Q System Development is a paradigm for developing distributed systems\nthat meet performance requirements.\n\nIn this paradigm,\nthe system designer starts by defining high-level outcomes,\nexplores different refinements into combinations of lower-level outcomes,\nand evaluates their performance characteristics.\n\nThe `deltaq` package (pronounced \"Delta Q\") provides\ndata types and functions for\n\n* outcomes and their combinations\n* evaluating the performance characteristics of outcomes,\n  specifically the probability distribution of their completion times\n* rendering outcomes as diagrams";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Chart" or (errorHandler.buildDepError "Chart"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."lattices" or (errorHandler.buildDepError "lattices"))
          (hsPkgs."probability-polynomial" or (errorHandler.buildDepError "probability-polynomial"))
          (hsPkgs."diagrams-lib" or (errorHandler.buildDepError "diagrams-lib"))
          (hsPkgs."diagrams-svg" or (errorHandler.buildDepError "diagrams-svg"))
        ];
        buildable = true;
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deltaq" or (errorHandler.buildDepError "deltaq"))
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
        "basic" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cassava" or (errorHandler.buildDepError "cassava"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."deltaq" or (errorHandler.buildDepError "deltaq"))
            (hsPkgs."hvega" or (errorHandler.buildDepError "hvega"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."statistics" or (errorHandler.buildDepError "statistics"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }