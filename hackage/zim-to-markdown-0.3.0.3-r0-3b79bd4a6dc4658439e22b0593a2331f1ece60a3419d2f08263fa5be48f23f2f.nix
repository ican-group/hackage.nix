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
      specVersion = "3.0";
      identifier = { name = "zim-to-markdown"; version = "0.3.0.3"; };
      license = "BSD-3-Clause";
      copyright = "2026 Tunai Raiol";
      maintainer = "Tralen <dev@tralen.cc>";
      author = "Tunai Raiol <dev@tralen.cc>";
      homepage = "https://github.com/Tralen/zim-to-markdown";
      url = "";
      synopsis = "Converts Zim wiki pages to Markdown and back.";
      description = "A command line converter between Zim wiki markup and Markdown.\n\nIt converts single pages and whole notebooks in both directions,\ncopies notebook assets, preserves the folder structure, and resolves\ninternal links.\n\nZim metadata headers are removed and heading levels are normalized\nfor Markdown output.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      exes = {
        "zim-to-markdown" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."zim-to-markdown" or (errorHandler.buildDepError "zim-to-markdown"))
          ];
          buildable = true;
        };
      };
      tests = {
        "zim-to-markdown-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."zim-to-markdown" or (errorHandler.buildDepError "zim-to-markdown"))
          ];
          buildable = true;
        };
      };
    };
  }