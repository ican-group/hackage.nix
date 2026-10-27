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
      identifier = { name = "gridtables"; version = "0.1.1.1"; };
      license = "MIT";
      copyright = "© 2022-2026 Posit Software, PBC";
      maintainer = "Albert Krewinkel <albert@zeitkraut.de>";
      author = "Albert Krewinkel";
      homepage = "https://github.com/tarleb/gridtables";
      url = "";
      synopsis = "Parser for reStructuredText-style grid tables.";
      description = "Provides a parser for plain-text representations of\ntables. This package supports table headers, cells\nspanning multiple columns or rows, as well as a way\nto specfiy column alignments.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."doclayout" or (errorHandler.buildDepError "doclayout"))
        ];
        buildable = true;
      };
      tests = {
        "test-gridtables" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."gridtables" or (errorHandler.buildDepError "gridtables"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }