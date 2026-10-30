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
      identifier = { name = "hasql-check"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2021-2026 Kronor";
      maintainer = "lorenzo@kronor.io, pranay.sashank@kronor.io";
      author = "Pranay Sashank, Jose Lorenzo Rodriguez";
      homepage = "https://github.com/kronor-io/hasql-check";
      url = "";
      synopsis = "Check hasql-th statements against a live PostgreSQL schema";
      description = "Finds the hasql-th quasiquotes in Haskell source files and PREPAREs each\nstatement against a live PostgreSQL database, so statements that no longer\nmatch the schema fail in CI rather than at runtime.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-th" or (errorHandler.buildDepError "hasql-th"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."postgresql-syntax" or (errorHandler.buildDepError "postgresql-syntax"))
          (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
          (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.alex.components.exes.alex or (pkgs.pkgsBuildBuild.alex or (errorHandler.buildToolDepError "alex:alex")))
          (hsPkgs.pkgsBuildBuild.happy.components.exes.happy or (pkgs.pkgsBuildBuild.happy or (errorHandler.buildToolDepError "happy:happy")))
        ];
        buildable = true;
      };
      exes = {
        "hasql-check" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-check" or (errorHandler.buildDepError "hasql-check"))
            (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
            (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "hasql-check-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-check" or (errorHandler.buildDepError "hasql-check"))
            (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."sydtest" or (errorHandler.buildDepError "sydtest"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hasql-check.components.exes.hasql-check or (pkgs.pkgsBuildBuild.hasql-check or (errorHandler.buildToolDepError "hasql-check:hasql-check")))
          ];
          buildable = true;
        };
      };
    };
  }