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
      identifier = { name = "cek-pykinos"; version = "0.1.0.2"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/cek";
      url = "";
      synopsis = "Unrolled 32-frame SoA KontStack and 4096-cell chunked Store arena for CEK";
      description = "High-performance unboxed continuation stack and Store arena for CEK abstract machines,\nintegrating Pykinos unboxed blocked memory substrates.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."cek-core" or (errorHandler.buildDepError "cek-core"))
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
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }