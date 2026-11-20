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
      identifier = { name = "cek-examples"; version = "0.1.0.2"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/cek";
      url = "";
      synopsis = "Umbrella showcase suite of mini-interpreters for CEK abstract machines";
      description = "Showcase mini-interpreters (Scheme, Prolog/Mercury, 1ML) demonstrating\nautomatic Generic1 dissection, O(1) continuation capture, and MergeMorph3 sealing.\n\nNotice: This umbrella package aggregates the standalone example packages\n@cek-scheme@, @cek-mercury@, and @cek-oneml@ for testing and demonstration.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."cek-scheme" or (errorHandler.buildDepError "cek-scheme"))
          (hsPkgs."cek-mercury" or (errorHandler.buildDepError "cek-mercury"))
          (hsPkgs."cek-oneml" or (errorHandler.buildDepError "cek-oneml"))
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
            (hsPkgs."cek-examples" or (errorHandler.buildDepError "cek-examples"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }