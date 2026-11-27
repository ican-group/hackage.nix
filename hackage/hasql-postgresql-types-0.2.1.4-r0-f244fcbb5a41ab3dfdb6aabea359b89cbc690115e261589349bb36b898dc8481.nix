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
      identifier = { name = "hasql-postgresql-types"; version = "0.2.1.4"; };
      license = "MIT";
      copyright = "(c) 2026, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/hasql-postgresql-types";
      url = "";
      synopsis = "Integration of \"hasql\" with \"postgresql-types\"";
      description = "Provides automatic encoder and decoder generation for [\"hasql\"](https://hackage.haskell.org/package/hasql),\nsupporting all PostgreSQL types defined in the [\"postgresql-types\"](https://hackage.haskell.org/package/postgresql-types) package.\n\n== Motivation\n\nThe standard \"hasql\" codecs use common Haskell types like `Text`, `DiffTime`, `UTCTime`, etc. However these types do not always map precisely to PostgreSQL types. E.g., the PostgreSQL `interval` type carries information about months, years and microseconds, while the Haskell `DiffTime` type only represents a time difference in picoseconds. Such mismatches can lead to data loss or unexpected behavior. The [\"postgresql-types\"](https://github.com/nikita-volkov/postgresql-types) library addresses such issues by providing precise Haskell representations for PostgreSQL types. This package integrates it with \"hasql\". It also provides a class-based polymorphic interface for defining \"hasql\" `Value` codecs.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-mapping" or (errorHandler.buildDepError "hasql-mapping"))
          (hsPkgs."postgresql-types" or (errorHandler.buildDepError "postgresql-types"))
          (hsPkgs."postgresql-types-algebra" or (errorHandler.buildDepError "postgresql-types-algebra"))
          (hsPkgs."ptr-peeker" or (errorHandler.buildDepError "ptr-peeker"))
          (hsPkgs."ptr-poker" or (errorHandler.buildDepError "ptr-poker"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
        ];
        buildable = true;
      };
    };
  }