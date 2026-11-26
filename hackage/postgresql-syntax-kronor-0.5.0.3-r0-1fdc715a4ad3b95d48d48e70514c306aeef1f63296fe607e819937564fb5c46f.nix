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
      identifier = { name = "postgresql-syntax-kronor"; version = "0.5.0.3"; };
      license = "MIT";
      copyright = "(c) 2020, Nikita Volkov";
      maintainer = "José Lorenzo Rodríguez <lorenzo@kronor.io>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/kronor-io/postgresql-syntax";
      url = "";
      synopsis = "PostgreSQL AST parsing and rendering, with Kronor's Haskell target extension";
      description = "Kronor's fork of \\\"postgresql-syntax\\\": the Postgres syntax tree and\nrelated utils extracted from the \\\"hasql-th\\\" package, extended with the\nHaskell targets and parameter fields that \\\"hasql-th-kronor\\\" quasiquotes\naccept. It exposes the same modules as \\\"postgresql-syntax\\\".";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."postgresql-syntax-kronor".components.sublibs.internal or (errorHandler.buildDepError "postgresql-syntax-kronor:internal"))
        ];
        buildable = true;
      };
      sublibs = {
        "internal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."headed-megaparsec" or (errorHandler.buildDepError "headed-megaparsec"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
            (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = true;
        };
      };
      tests = {
        "hspec-test" = {
          depends = [
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
            (hsPkgs."postgresql-syntax-kronor".components.sublibs.internal or (errorHandler.buildDepError "postgresql-syntax-kronor:internal"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "keyword-bench" = {
          depends = [
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."headed-megaparsec" or (errorHandler.buildDepError "headed-megaparsec"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
            (hsPkgs."postgresql-syntax-kronor" or (errorHandler.buildDepError "postgresql-syntax-kronor"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
          ];
          buildable = true;
        };
        "nesting-bench" = {
          depends = [
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."postgresql-syntax-kronor" or (errorHandler.buildDepError "postgresql-syntax-kronor"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
          ];
          buildable = true;
        };
      };
    };
  }