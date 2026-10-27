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
      specVersion = "1.10";
      identifier = { name = "search-algorithms"; version = "0.3.5"; };
      license = "BSD-3-Clause";
      copyright = "2017 Devon Hollowood";
      maintainer = "devonhollowood@gmail.com";
      author = "Devon Hollowood";
      homepage = "https://github.com/devonhollowood/search-algorithms#readme";
      url = "";
      synopsis = "Common graph search algorithms";
      description = "Library containing common graph search algorithms,\nincluding depth-first and breadth-first searches,\nDijkstra's algorithm, and A*";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      tests = {
        "search-algorithms-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."search-algorithms" or (errorHandler.buildDepError "search-algorithms"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
        "doc-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."search-algorithms" or (errorHandler.buildDepError "search-algorithms"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "search-algorithms-benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."search-algorithms" or (errorHandler.buildDepError "search-algorithms"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
          ];
          buildable = true;
        };
      };
    };
  }