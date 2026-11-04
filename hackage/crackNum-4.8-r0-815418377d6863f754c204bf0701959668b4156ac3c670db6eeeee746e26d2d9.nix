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
      specVersion = "2.4";
      identifier = { name = "crackNum"; version = "4.8"; };
      license = "BSD-3-Clause";
      copyright = "Levent Erkok";
      maintainer = "erkokl@gmail.com";
      author = "Levent Erkok";
      homepage = "http://github.com/LeventErkok/CrackNum";
      url = "";
      synopsis = "Crack various integer and floating-point data formats";
      description = "Crack IEEE-754 and other float formats and arbitrary sized words and integers, showing the layout.\nAlong with a command-line interface on any platform, native MacOS and Windows GUIs, a Tcl-based Linux GUI, and a browser front-end are available as well:\n\n<<https://raw.githubusercontent.com/LeventErkok/crackNum/master/crackNumGUI.png>>\n\nFor details, please see: <http://github.com/LeventErkok/crackNum/>.\n\nYou do not need a Haskell toolchain to use crackNum: the <https://github.com/LeventErkok/crackNum/releases releases page> has ready-to-run bundles for Mac, Linux, and Windows.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "crackNum" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."libBF" or (errorHandler.buildDepError "libBF"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."sbv" or (errorHandler.buildDepError "sbv"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ];
          buildable = true;
        };
      };
      tests = {
        "crackNum-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.crackNum.components.exes.crackNum or (pkgs.pkgsBuildBuild.crackNum or (errorHandler.buildToolDepError "crackNum:crackNum")))
          ];
          buildable = true;
        };
      };
    };
  }