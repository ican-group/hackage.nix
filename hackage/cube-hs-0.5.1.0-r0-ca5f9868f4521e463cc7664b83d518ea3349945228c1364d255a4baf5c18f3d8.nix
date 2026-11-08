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
      identifier = { name = "cube-hs"; version = "0.5.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "fsinhx@gmail.com";
      author = "coshz";
      homepage = "https://github.com/coshz/cube";
      url = "";
      synopsis = "High-performance, type-safe Rubik's Cube solver with C FFI bindings.";
      description = "A professional Haskell library providing algebraic operations and zero-cost FFI bindings to C solvers for Rubik's Cube. ";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."vector-sized" or (errorHandler.buildDepError "vector-sized"))
          (hsPkgs."system-cxx-std-lib" or (errorHandler.buildDepError "system-cxx-std-lib"))
        ];
        buildable = true;
      };
      tests = {
        "cube-hs-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cube-hs" or (errorHandler.buildDepError "cube-hs"))
          ];
          buildable = true;
        };
      };
    };
  }