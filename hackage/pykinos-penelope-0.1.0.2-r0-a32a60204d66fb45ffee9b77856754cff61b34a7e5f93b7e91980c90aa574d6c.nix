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
      identifier = { name = "pykinos-penelope"; version = "0.1.0.2"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/pykinos";
      url = "";
      synopsis = "Transient Epoch mutation and lockless MVCC handles for Pykinos";
      description = "Penelope effect system integration with Pykinos unboxed data structures,\nproviding transient epoch isolation (withTransientEpoch) and lockless\ncategorical pushout merges (pushoutMergeMVCC) over divergent transaction branches.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."pykinos-core" or (errorHandler.buildDepError "pykinos-core"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      tests = {
        "pykinos-penelope-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pykinos-core" or (errorHandler.buildDepError "pykinos-core"))
            (hsPkgs."pykinos-penelope" or (errorHandler.buildDepError "pykinos-penelope"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          ];
          buildable = true;
        };
      };
    };
  }