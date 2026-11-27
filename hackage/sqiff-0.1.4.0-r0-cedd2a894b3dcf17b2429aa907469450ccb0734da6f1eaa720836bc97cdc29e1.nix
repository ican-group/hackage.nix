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
      identifier = { name = "sqiff"; version = "0.1.4.0"; };
      license = "MIT";
      copyright = "2026 Kronor";
      maintainer = "lorenzo@kronor.io";
      author = "José Lorenzo Rodríguez";
      homepage = "https://github.com/kronor-io/sqiff";
      url = "";
      synopsis = "Describe and diff PostgreSQL schemas from their catalogs";
      description = "sqiff compares PostgreSQL schemas and writes the difference as sqitch\nchanges. Edit a table's create table file as if writing the table today,\nand sqiff writes the migration, revert and verify scripts that get an\nexisting database there, with the dependent views and functions and the\nhazards each statement brings.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."Diff" or (errorHandler.buildDepError "Diff"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-th-kronor" or (errorHandler.buildDepError "hasql-th-kronor"))
          (hsPkgs."opt-env-conf" or (errorHandler.buildDepError "opt-env-conf"))
          (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
          (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
          (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."typed-process" or (errorHandler.buildDepError "typed-process"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
        ];
        buildable = true;
      };
      exes = {
        "sqiff" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
            (hsPkgs."sqiff" or (errorHandler.buildDepError "sqiff"))
            (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "sqiff-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-th-kronor" or (errorHandler.buildDepError "hasql-th-kronor"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
            (hsPkgs."sqiff" or (errorHandler.buildDepError "sqiff"))
            (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-expected-failure" or (errorHandler.buildDepError "tasty-expected-failure"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hedgehog" or (errorHandler.buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."typed-process" or (errorHandler.buildDepError "typed-process"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.sqiff.components.exes.sqiff or (pkgs.pkgsBuildBuild.sqiff or (errorHandler.buildToolDepError "sqiff:sqiff")))
          ];
          buildable = true;
        };
      };
    };
  }