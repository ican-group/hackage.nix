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
    flags = { lint = false; kronor-syntax = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "hasql-th-format"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Kronor";
      maintainer = "lorenzo@kronor.io";
      author = "Kronor";
      homepage = "https://github.com/kronor-io/hasql-check";
      url = "";
      synopsis = "Format the SQL inside hasql-th quasiquotes";
      description = "Rewrites the SQL in every hasql-th quasiquote of a Haskell source file into\none house layout, in place. It parses each statement, renders it again, and\nre-parses the result, so a formatting pass that would change what the\nstatement means fails instead of being written out.\n.\nShips two executables: @hasql-th-format@, the formatter itself, and\n@hasql-th-audit@, which diffs the statements of two revisions of a file\nquasiquote by quasiquote, so a reformatting commit can be shown to have\nchanged no SQL.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "hasql-th-format" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hasql-check" or (errorHandler.buildDepError "hasql-check"))
            (hsPkgs."postgresql-syntax" or (errorHandler.buildDepError "postgresql-syntax"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
          ];
          buildable = true;
        };
        "hasql-th-audit" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hasql-check" or (errorHandler.buildDepError "hasql-check"))
            (hsPkgs."postgresql-syntax" or (errorHandler.buildDepError "postgresql-syntax"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "hasql-th-format-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hasql-check" or (errorHandler.buildDepError "hasql-check"))
            (hsPkgs."postgresql-syntax" or (errorHandler.buildDepError "postgresql-syntax"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
          ];
          buildable = true;
        };
      };
    };
  }