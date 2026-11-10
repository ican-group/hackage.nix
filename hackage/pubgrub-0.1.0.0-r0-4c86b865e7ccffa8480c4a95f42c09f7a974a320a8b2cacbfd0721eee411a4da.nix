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
      identifier = { name = "pubgrub"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Tweag I/O by Modus Create";
      maintainer = "andrea.bedini@moduscreate.com";
      author = "Andrea Bedini";
      homepage = "https://github.com/tweag/pubgrub-hs";
      url = "";
      synopsis = "The PubGrub version solver";
      description = "PubGrub is a version-solving algorithm: unit propagation with\nconflict-driven learning, and, when there is no solution, a proof of why\nthat can be written out for a person to read.\n\nThis is a Haskell implementation that is generic over the domain. A type class\nsays what the variables, values, sets of values and facts are; a callback\nanswers the solver's questions one variable at a time; and the explanation\nof a failure is worded by the domain.\n\nStart with the tutorial in \"PubGrub.Tutorial\". \"PubGrub.Cookbook\" has\nhow-to guides, and \"PubGrub\" explains the model and re-exports what a user\nnormally needs. The domain of Haskell packages is the @pubgrub-cabal@\npackage.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."co-log-core" or (errorHandler.buildDepError "co-log-core"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "pubgrub-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."co-log-core" or (errorHandler.buildDepError "co-log-core"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }