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
      identifier = { name = "cek-oneml"; version = "0.1.0.2"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/cek";
      url = "";
      synopsis = "Demonstrative 1ML first-class module evaluator for CEK machines";
      description = "An educational and demonstrative reference evaluator showcasing Andreas\nRossberg's 1ML first-class module system over the CEK abstract machine with\nMergeMorph3 existential sealing and Pykinos hidden classes.\n\nNotice: This package is provided primarily as an executable architectural example\nand documentation case study within the @cek@ ecosystem.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."cek-core" or (errorHandler.buildDepError "cek-core"))
          (hsPkgs."cek-pykinos" or (errorHandler.buildDepError "cek-pykinos"))
          (hsPkgs."pykinos-core" or (errorHandler.buildDepError "pykinos-core"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cek-core" or (errorHandler.buildDepError "cek-core"))
            (hsPkgs."cek-pykinos" or (errorHandler.buildDepError "cek-pykinos"))
            (hsPkgs."pykinos-core" or (errorHandler.buildDepError "pykinos-core"))
            (hsPkgs."cek-oneml" or (errorHandler.buildDepError "cek-oneml"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }