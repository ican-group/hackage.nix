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
      identifier = { name = "titlecase"; version = "1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Peter Simons <simons@cryp.to>";
      author = "Nikita Karetnikov,\nPeter Simons,\nAaron Wolf,\nSerg Nesterov";
      homepage = "https://github.com/peti/titlecase#readme";
      url = "";
      synopsis = "Convert English Words to Title Case";
      description = "Capitalize all English words except articles (a, an, the),\ncoordinating conjunctions (for, and, nor, but, or, yet,\nso), and prepositions (unless they begin or end the\ntitle). The prepositions are taken from\n<https://en.wikipedia.org/wiki/List_of_English_prepositions Wikipedia>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
      exes = {
        "titlecase" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."titlecase" or (errorHandler.buildDepError "titlecase"))
          ];
          buildable = true;
        };
      };
      tests = {
        "regression-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."titlecase" or (errorHandler.buildDepError "titlecase"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
    };
  }