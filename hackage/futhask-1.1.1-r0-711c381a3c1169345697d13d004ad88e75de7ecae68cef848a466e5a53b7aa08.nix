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
      identifier = { name = "futhask"; version = "1.1.1"; };
      license = "BSD-3-Clause";
      copyright = "2020, Gusten Isfeldt";
      maintainer = "isfeldt@kth.se";
      author = "Gusten Isfeldt";
      homepage = "";
      url = "";
      synopsis = "Generate Haskell wrappers for Futhark libraries";
      description = "Please see the README on GitLab at <https://gitlab.com/Gusten_Isfeldt/futhask#futhask>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."futhark-manifest" or (errorHandler.buildDepError "futhark-manifest"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      exes = {
        "futhask" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."futhask" or (errorHandler.buildDepError "futhask"))
            (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."futhark-manifest" or (errorHandler.buildDepError "futhark-manifest"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
          buildable = true;
        };
      };
    };
  }