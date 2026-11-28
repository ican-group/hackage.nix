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
    flags = { kronor-syntax = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "pgstyle"; version = "0.1.2.0"; };
      license = "MIT";
      copyright = "2026 Kronor";
      maintainer = "dev@kronor.io";
      author = "Kronor";
      homepage = "https://github.com/kronor-io/pgstyle";
      url = "";
      synopsis = "Format PostgreSQL, checked against PostgreSQL's own parser";
      description = "pgstyle formats SQL files statement by statement. Each statement is laid out\neither by pgstyle's own renderer (DML, over libpg_query's parse tree) or by\nlibpg_query's pretty-printer (anything PostgreSQL parses), and is only\nrewritten if libpg_query reads the result as the same statement.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."libpg-query" or (errorHandler.buildDepError "libpg-query"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          (hsPkgs."postgresql-syntax" or (errorHandler.buildDepError "postgresql-syntax"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."proto-lens" or (errorHandler.buildDepError "proto-lens"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
        ] ++ [
          (hsPkgs."postgresql-syntax" or (errorHandler.buildDepError "postgresql-syntax"))
        ];
        libs = [ (pkgs."pg_query" or (errorHandler.sysDepError "pg_query")) ];
        buildable = true;
      };
      exes = {
        "pgstyle" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pgstyle" or (errorHandler.buildDepError "pgstyle"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "render" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pgstyle" or (errorHandler.buildDepError "pgstyle"))
            (hsPkgs."postgresql-syntax" or (errorHandler.buildDepError "postgresql-syntax"))
            (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "file" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pgstyle" or (errorHandler.buildDepError "pgstyle"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "haskell" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pgstyle" or (errorHandler.buildDepError "pgstyle"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "layout" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pgstyle" or (errorHandler.buildDepError "pgstyle"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }