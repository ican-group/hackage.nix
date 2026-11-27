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
      identifier = { name = "hasql-dynamic-statements"; version = "0.5.1.3"; };
      license = "MIT";
      copyright = "(c) 2019, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/hasql-dynamic-statements";
      url = "";
      synopsis = "Hasql extension for dynamic construction of statements";
      description = "Library extending Hasql with a composable API for building SQL statements dynamically.\n\nThe core abstraction is 'Snippet', which allows you to construct SQL statements with parameters\ninjected in-place, automatically handling placeholders and encoder matching. This is particularly\nuseful when the structure of your SQL depends on runtime parameters.\n\nKey features:\n\n* Composable SQL snippets using 'Semigroup' and 'Monoid' instances\n* Automatic placeholder generation and parameter encoding\n* Type-safe parameter injection with implicit encoder derivation\n* Protection against common SQL construction bugs\n* Support for conditional SQL structure based on parameters\n\nExample:\n\n> selectSubstring :: Text -> Maybe Int32 -> Maybe Int32 -> Snippet\n> selectSubstring string from to =\n>   \"select substring(\" <> param string <>\n>   foldMap (\\x -> \" from \" <> param x) from <>\n>   foldMap (\\x -> \" for \" <> param x) to <>\n>   \")\"";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-implicits" or (errorHandler.buildDepError "hasql-implicits"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
        ];
        buildable = true;
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-dynamic-statements" or (errorHandler.buildDepError "hasql-dynamic-statements"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."pqi-native" or (errorHandler.buildDepError "pqi-native"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
            (hsPkgs."testcontainers-postgresql" or (errorHandler.buildDepError "testcontainers-postgresql"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }