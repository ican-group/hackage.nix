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
      identifier = { name = "postgresql-simple-ltree"; version = "0.0.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2022 SimSpace";
      maintainer = "carymrobbins@gmail.com";
      author = "Cary Robbins";
      homepage = "https://github.com/simspace/postgresql-ltree#readme";
      url = "";
      synopsis = "Instances for using ltree with postgresql-simple";
      description = "Please see the README on GitHub at <https://github.com/simspace/postgresql-ltree#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."postgresql-ltree" or (errorHandler.buildDepError "postgresql-ltree"))
          (hsPkgs."postgresql-simple" or (errorHandler.buildDepError "postgresql-simple"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "postgresql-simple-ltree-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."monad-logger" or (errorHandler.buildDepError "monad-logger"))
            (hsPkgs."postgresql-ltree" or (errorHandler.buildDepError "postgresql-ltree"))
            (hsPkgs."postgresql-simple" or (errorHandler.buildDepError "postgresql-simple"))
            (hsPkgs."postgresql-simple-ltree" or (errorHandler.buildDepError "postgresql-simple-ltree"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."tmp-postgres" or (errorHandler.buildDepError "tmp-postgres"))
          ];
          buildable = true;
        };
      };
    };
  }