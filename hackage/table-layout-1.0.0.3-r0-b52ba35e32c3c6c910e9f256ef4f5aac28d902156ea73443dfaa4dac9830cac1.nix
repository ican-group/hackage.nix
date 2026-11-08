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
      identifier = { name = "table-layout"; version = "1.0.0.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "muesli4@gmail.com";
      author = "Moritz Bruder";
      homepage = "https://github.com/muesli4/table-layout";
      url = "";
      synopsis = "Format tabular data as grid or table.";
      description = "`table-layout` is a library for text-based table layout and cell formatting\nwith the following features:\n\n* Set a policy for each column to determine the width.\n\n* Position content in a column at a certain position.\n\n* Align content in a column at a character occurence.\n\n* Highlight trimmed content with cut marks.\n\n* Draw fancy tables with optional headers and user styles.\n\n* Automatically justify text and create multi-line table cells.\n\nThe module `Text.Layout.Table` contains everything that is required.\nHowever, all of the intermediate functionality is also exposed which makes\nit easy to create something completely new. A small tutorial is provided in\nthe `README.md` file.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
          (hsPkgs."doclayout" or (errorHandler.buildDepError "doclayout"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      exes = {
        "table-layout-test-styles" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
            (hsPkgs."doclayout" or (errorHandler.buildDepError "doclayout"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "table-layout-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
            (hsPkgs."doclayout" or (errorHandler.buildDepError "doclayout"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }