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
    flags = { assertions = false; double-precision = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "Box3D"; version = "0.1.0.0"; };
      license = "BSD-3-Clause AND MIT";
      copyright = "2026 IC Rainbow";
      maintainer = "aenor.realm@gmail.com";
      author = "IC Rainbow";
      homepage = "";
      url = "";
      synopsis = "Low-level bindings to the Box3D physics engine";
      description = "Low-level FFI bindings to Box3D, Erin Catto's 3D rigid-body physics engine.\nThe engine's C sources (MIT licensed) are bundled and compiled with the\npackage, so no system library is needed.\n\nEach module follows one part of the C API, and each wrapper's documentation\nnames the function it binds. See the README for an example, the exact engine\nrevision and the rules on callbacks and object lifetimes.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "Box3D-test" = {
          depends = [
            (hsPkgs."Box3D" or (errorHandler.buildDepError "Box3D"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "Box3D-bench" = {
          depends = [
            (hsPkgs."Box3D" or (errorHandler.buildDepError "Box3D"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }