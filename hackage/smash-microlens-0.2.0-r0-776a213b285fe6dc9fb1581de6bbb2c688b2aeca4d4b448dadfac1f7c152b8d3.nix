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
      specVersion = "2.0";
      identifier = { name = "smash-microlens"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2020-2026 Emily Pillmore <emilypi@cohomolo.gy>";
      maintainer = "emilypi@cohomolo.gy";
      author = "Emily Pillmore";
      homepage = "https://github.com/emilypi/smash";
      url = "";
      synopsis = "Optics for the `smash` library";
      description = "Optics for the `smash` library using `microlens`";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          (hsPkgs."smash" or (errorHandler.buildDepError "smash"))
        ];
        buildable = true;
      };
      tests = {
        "smash-microlens-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."smash-microlens" or (errorHandler.buildDepError "smash-microlens"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."smash" or (errorHandler.buildDepError "smash"))
            (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          ];
          buildable = true;
        };
      };
    };
  }