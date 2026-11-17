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
    flags = { demo = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "brick-list-skip"; version = "0.1.1.18"; };
      license = "0BSD";
      copyright = "";
      maintainer = "amano.kenji@proton.me";
      author = "amano.kenji";
      homepage = "https://codeberg.org/amano.kenji/brick-list-skip";
      url = "";
      synopsis = "Skip a certain kind of items when moving in brick list";
      description = "This package contains functions that can be used in brick event handlers to skip a certain kind of items when\nmoving in brick list.\n\nFor example, you can skip a separator because selecting a separator doesn't make sense.\n\nYou can run demo programs to see how it works.\n\n== For Contributors\n\nThis library tries not to exceed 120 characters per line.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      exes = {
        "brick-list-skip" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
            (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."brick-list-skip" or (errorHandler.buildDepError "brick-list-skip"))
            (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
          ];
          buildable = if !flags.demo then false else true;
        };
      };
    };
  }