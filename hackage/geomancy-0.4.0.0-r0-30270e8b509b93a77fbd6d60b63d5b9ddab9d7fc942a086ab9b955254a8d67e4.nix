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
    flags = { serialise = true; th-lift = true; };
    package = {
      specVersion = "1.12";
      identifier = { name = "geomancy"; version = "0.4.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2020-2026 IC Rainbow";
      maintainer = "aenor.realm@gmail.com";
      author = "IC Rainbow";
      homepage = "";
      url = "";
      synopsis = "Vectors and matrix manipulation";
      description = "Sometimes it is unavoidable you have to do stuff on CPU.\nLet's at least do it faster.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."gl-block" or (errorHandler.buildDepError "gl-block"))
          (hsPkgs."mono-traversable" or (errorHandler.buildDepError "mono-traversable"))
          (hsPkgs."ptrdiff" or (errorHandler.buildDepError "ptrdiff"))
          (hsPkgs."simple-affine-space" or (errorHandler.buildDepError "simple-affine-space"))
          (hsPkgs."webcolor-labels" or (errorHandler.buildDepError "webcolor-labels"))
        ] ++ pkgs.lib.optional (flags.th-lift) (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))) ++ pkgs.lib.optional (flags.serialise) (hsPkgs."serialise" or (errorHandler.buildDepError "serialise"));
        buildable = true;
      };
      tests = {
        "geomancy-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."geomancy" or (errorHandler.buildDepError "geomancy"))
            (hsPkgs."gl-block" or (errorHandler.buildDepError "gl-block"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."simple-affine-space" or (errorHandler.buildDepError "simple-affine-space"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (errorHandler.buildDepError "tasty-hedgehog"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "geomancy-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."geomancy" or (errorHandler.buildDepError "geomancy"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."simple-affine-space" or (errorHandler.buildDepError "simple-affine-space"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = true;
        };
      };
    };
  }