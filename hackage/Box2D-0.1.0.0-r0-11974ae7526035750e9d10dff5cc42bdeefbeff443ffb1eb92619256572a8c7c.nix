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
      identifier = { name = "Box2D"; version = "0.1.0.0"; };
      license = "BSD-3-Clause AND MIT";
      copyright = "2026 IC Rainbow";
      maintainer = "aenor.realm@gmail.com";
      author = "IC Rainbow";
      homepage = "";
      url = "";
      synopsis = "Low-level bindings to the Box2D physics engine";
      description = "Low-level FFI bindings to Box2D, Erin Catto's 2D rigid-body physics engine.\nThe engine's C sources (v3.2.0, MIT licensed) are bundled and compiled with\nthe package, so no system library is needed.\n\nEach module follows one part of the C API, and each wrapper's documentation\nnames the function it binds. See the README for an example and the rules on\ncallbacks and object lifetimes.";
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
        "Box2D-test" = {
          depends = [
            (hsPkgs."Box2D" or (errorHandler.buildDepError "Box2D"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "Box2D-bench" = {
          depends = [
            (hsPkgs."Box2D" or (errorHandler.buildDepError "Box2D"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }