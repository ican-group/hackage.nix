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
      identifier = { name = "linearizable"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Laurent P. René de Cotret";
      maintainer = "laurent.decotret@outlook.com";
      author = "Laurent P. René de Cotret";
      homepage = "https://github.com/LaurentRDC/distributed-consensus";
      url = "";
      synopsis = "Linearizability checker";
      description = "Linearizability checker for experimental event histories. This is useful for testing\nthe properties of a distributed system given, for example.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      tests = {
        "linearizable-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."linearizable" or (errorHandler.buildDepError "linearizable"))
          ];
          buildable = true;
        };
      };
    };
  }