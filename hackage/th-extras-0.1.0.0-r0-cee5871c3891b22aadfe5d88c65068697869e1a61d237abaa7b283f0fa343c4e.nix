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
      identifier = { name = "th-extras"; version = "0.1.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "Erik de Castro Lopo <erikd@mega-nerd.com>";
      author = "James Cook <mokus@deepbondi.net>";
      homepage = "https://github.com/erikd/th-extras";
      url = "";
      synopsis = "A grab bag of functions for use with Template Haskell";
      description = "A grab bag of functions for use with Template Haskell.\n\nThis is basically the place I put all my ugly CPP hacks to support\nthe ever-changing interface of the template haskell system by\nproviding high-level operations and making sure they work on as many\nversions of Template Haskell as I can.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."th-abstraction" or (errorHandler.buildDepError "th-abstraction"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
        ];
        buildable = true;
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."th-abstraction" or (errorHandler.buildDepError "th-abstraction"))
            (hsPkgs."th-extras" or (errorHandler.buildDepError "th-extras"))
          ];
          buildable = true;
        };
      };
    };
  }