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
      specVersion = "1.18";
      identifier = { name = "snippet"; version = "0.0.0.0"; };
      license = "AGPL-3.0-only";
      copyright = "";
      maintainer = "Patrick Brisbin";
      author = "";
      homepage = "https://codeberg.org/pbrisbin/sarif-tools#readme";
      url = "";
      synopsis = "Pretty-print regions within source code files";
      description = "Pretty-print @Region@s of source-code, i.e. snippets.\n\nThis is meant to mimic tooling available in rust and used by tools such as\n@sarif-fmt@.\n\nFor example, focusing on a region within our README:\n\n@\n\\   ┌─ README.md:32:8\n\\   │\n\\32 │   main = do\n\\   │ ╭────────^\n\\33 │ │   let\n\\34 │ │     region = Region\n\\35 │ │       { startLine = 32\n\\36 │ │       , endLine = Just 44\n\\37 │ │       , startColumn = Just 8\n\\38 │ │       , endColumn = Nothing\n\\39 │ │       }\n\\40 │ │\n\\41 │ │   -- Returns Nothing if file is missing/empty or region is invalid\n\\42 │ │   mSnippet <- snippetFromFile region \"README.md\"\n\\43 │ │\n\\44 │ │   traverse_ (putDoc . reAnnotate annToAnsi . prettySnippet) mSnippet\n\\   │ ╰────────────────────────────────────────────────────────────────────^\n@\n\nTo see the code that produces this, and an image of the output (e.g. with\ncolor), view the [README on Codeberg](https://codeberg.org/pbrisbin/snippet#readme).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."prettyprinter-ansi-terminal" or (errorHandler.buildDepError "prettyprinter-ansi-terminal"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "readme" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."markdown-unlit" or (errorHandler.buildDepError "markdown-unlit"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."prettyprinter-ansi-terminal" or (errorHandler.buildDepError "prettyprinter-ansi-terminal"))
            (hsPkgs."snippet" or (errorHandler.buildDepError "snippet"))
          ];
          buildable = true;
        };
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."snippet" or (errorHandler.buildDepError "snippet"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }