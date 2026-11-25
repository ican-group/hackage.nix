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
      specVersion = "3.4";
      identifier = { name = "sqint"; version = "0.1.0.1"; };
      license = "MIT";
      copyright = "2026 Kronor";
      maintainer = "lorenzo@kronor.io";
      author = "José Lorenzo Rodríguez";
      homepage = "https://github.com/kronor-io/sqint";
      url = "";
      synopsis = "Lint sqitch migrations for PostgreSQL lock and rewrite hazards";
      description = "sqint reads sqitch deploy scripts and reports statements that take\nheavy locks, rewrite or scan tables, defeat indexes, or leave SQL\nfunctions broken between changes. A static pass needs only the SQL;\nan optional dynamic pass deploys each new change to a scratch\ndatabase and observes the locks it actually takes.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."libpg-query" or (errorHandler.buildDepError "libpg-query"))
          (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
          (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."proto-lens" or (errorHandler.buildDepError "proto-lens"))
          (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
          (hsPkgs."sqitch-plan" or (errorHandler.buildDepError "sqitch-plan"))
          (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      exes = {
        "sqint" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."opt-env-conf" or (errorHandler.buildDepError "opt-env-conf"))
            (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
            (hsPkgs."sqint" or (errorHandler.buildDepError "sqint"))
          ];
          buildable = true;
        };
      };
      tests = {
        "sqint-test" = {
          depends = [
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
            (hsPkgs."sqint" or (errorHandler.buildDepError "sqint"))
            (hsPkgs."sqitch-plan" or (errorHandler.buildDepError "sqitch-plan"))
            (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }