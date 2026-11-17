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
      identifier = { name = "brick-tabular-list"; version = "2.2.0.17"; };
      license = "0BSD";
      copyright = "";
      maintainer = "amano.kenji@proton.me";
      author = "amano.kenji";
      homepage = "https://codeberg.org/amano.kenji/brick-tabular-list";
      url = "";
      synopsis = "Tabular list widgets for brick.";
      description = "This package contains two tabular list widgets for brick.\n\n* Grid tabular list\n* Mixed tabular list\n\nA tabular list consists of cells(row columns), column headers, and row headers. Column headers and row headers are\noptional.\n\nIt can handle a very large data set if you delete invisible rows from memory and fetch visible rows from a database\n(file). For example, SQLite database file can handle a large spreadsheet.\n\n== To get started\n\n* Read \"Brick.Widgets.TabularList.Grid\" or \"Brick.Widgets.TabularList.Mixed\".\n* Run demo programs. To learn more quickly, modify and run demo programs.\n\n== Lens support\n\nIf you want to use lens, I encourage using @OverloadedLabels@ extension with generic-lens or optics-core.\n\nFor zoom, you have to use van Laarhoven lens because brick supports zoom through microlens.\n\n== For Contributors\n\nThis library tries not to exceed 120 characters per line.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
          (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
        ];
        buildable = true;
      };
      exes = {
        "mixed-tabular-list" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
            (hsPkgs."brick-tabular-list" or (errorHandler.buildDepError "brick-tabular-list"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
          ];
          buildable = if !flags.demo then false else true;
        };
        "grid-tabular-list" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
            (hsPkgs."brick-tabular-list" or (errorHandler.buildDepError "brick-tabular-list"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
          ];
          buildable = if !flags.demo then false else true;
        };
      };
    };
  }