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
      identifier = { name = "cek-scheme"; version = "0.1.0.2"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/cek";
      url = "";
      synopsis = "Demonstrative Call-by-Value Scheme reference interpreter for CEK machines";
      description = "An educational and demonstrative reference interpreter showcasing Call-by-Value\nScheme with automatic Generic1 polynomial functor dissection, first-class call/cc\ncontinuations with O(1) Copy-on-Write capture, and mutable lexical variables\nover the CEK abstract machine architecture.\n\nNotice: This package is provided primarily as an executable architectural example\nand documentation case study within the @cek@ ecosystem.";
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
            (hsPkgs."cek-scheme" or (errorHandler.buildDepError "cek-scheme"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }