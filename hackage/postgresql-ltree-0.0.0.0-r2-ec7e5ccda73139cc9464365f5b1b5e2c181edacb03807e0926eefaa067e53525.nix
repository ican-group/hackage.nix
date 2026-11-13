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
      specVersion = "1.12";
      identifier = { name = "postgresql-ltree"; version = "0.0.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2022 SimSpace";
      maintainer = "carymrobbins@gmail.com";
      author = "Cary Robbins";
      homepage = "https://github.com/simspace/postgresql-ltree#readme";
      url = "";
      synopsis = "Types and functions for representing PostgreSQL's ltree";
      description = "Please see the README on GitHub at <https://github.com/simspace/postgresql-ltree#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
        ];
        buildable = true;
      };
      tests = {
        "postgresql-ltree-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."postgresql-ltree" or (errorHandler.buildDepError "postgresql-ltree"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }