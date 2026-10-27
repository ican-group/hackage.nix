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
    flags = { werror = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "ansido"; version = "1.0.0"; };
      license = "MIT";
      copyright = "2026 Tunai Raiol";
      maintainer = "Tralen <dev@tralen.cc>";
      author = "Tunai Raiol";
      homepage = "https://github.com/Tralen/ansido#readme";
      url = "";
      synopsis = "A terminal task manager built with Ansiform.";
      description = "A small task manager for the terminal. It keeps categories and tasks in a\nplain text file and draws a single task table with title, note and status\nusing the Ansiform formatting library.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."ansiform" or (errorHandler.buildDepError "ansiform"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
        ];
        buildable = true;
      };
      exes = {
        "ansido" = {
          depends = [
            (hsPkgs."ansido" or (errorHandler.buildDepError "ansido"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
          buildable = true;
        };
      };
      tests = {
        "ansido-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."ansido" or (errorHandler.buildDepError "ansido"))
            (hsPkgs."ansiform" or (errorHandler.buildDepError "ansiform"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
          buildable = true;
        };
      };
    };
  }