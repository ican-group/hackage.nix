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
    flags = { dump-splices = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "hasql-th-kronor"; version = "0.5.1.1"; };
      license = "MIT";
      copyright = "(c) 2015, Nikita Volkov";
      maintainer = "José Lorenzo Rodríguez <lorenzo@kronor.io>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/kronor-io/hasql-th";
      url = "";
      synopsis = "Template Haskell utilities for Hasql, with Kronor's quasiquote extensions";
      description = "Kronor's fork of \"hasql-th\", an extension-library for Hasql,\nbringing compile-time syntax checking,\ngreat simplification of declaration of statements and\nother TemplateHaskell-based utilities.\n\nThe quasiquotes also accept Haskell function, constructor and record\ntargets in the select list, and Haskell fields on parameter placeholders\n(documented in \"Hasql.TH\"). It exposes the same modules as \"hasql-th\" and\nparses with \"postgresql-syntax-kronor\".\n\nFor details please see <https://github.com/kronor-io/hasql-th the readme>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."foldl" or (errorHandler.buildDepError "foldl"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."postgresql-syntax-kronor" or (errorHandler.buildDepError "postgresql-syntax-kronor"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."template-haskell-compat-v0208" or (errorHandler.buildDepError "template-haskell-compat-v0208"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "smoke" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-th-kronor" or (errorHandler.buildDepError "hasql-th-kronor"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }