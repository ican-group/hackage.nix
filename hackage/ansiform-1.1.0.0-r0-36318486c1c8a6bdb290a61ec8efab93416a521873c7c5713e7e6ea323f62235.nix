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
      specVersion = "3.0";
      identifier = { name = "ansiform"; version = "1.1.0.0"; };
      license = "MIT";
      copyright = "2018-2026 Tunai Raiol";
      maintainer = "Tralen <dev@tralen.cc>";
      author = "Tunai Raiol";
      homepage = "https://github.com/Tralen/ansiform";
      url = "";
      synopsis = "Display formatting for command line interfaces.";
      description = "Basic format DSL for building an ANSI command line interface\nwith colors, alignment, tables, paragraphs and more.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."terminal-size" or (errorHandler.buildDepError "terminal-size"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
      exes = {
        "ansiform-demo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ansiform" or (errorHandler.buildDepError "ansiform"))
          ];
          buildable = true;
        };
        "ansiform-tutorial" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ansiform" or (errorHandler.buildDepError "ansiform"))
          ];
          buildable = true;
        };
      };
      tests = {
        "ansiform-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ansiform" or (errorHandler.buildDepError "ansiform"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
      };
    };
  }