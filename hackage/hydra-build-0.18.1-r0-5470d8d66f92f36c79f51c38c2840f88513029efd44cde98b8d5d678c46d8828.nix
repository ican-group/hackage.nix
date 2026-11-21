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
      specVersion = "1.12";
      identifier = { name = "hydra-build"; version = "0.18.1"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Joshua Shinavier <josh@fortytwo.net>";
      author = "Joshua Shinavier <josh@fortytwo.net>";
      homepage = "https://github.com/CategoricalData/hydra#readme";
      url = "";
      synopsis = "Hydra's build system, promoted into Hydra";
      description = "Hydra is an implementation of the LambdaGraph data model, which takes advantage of an isomorphism between labeled hypergraphs and typed lambda calculus: in Hydra, \"graphs are programs, and programs are graphs\". This package is Hydra's build system, promoted into Hydra itself: the manifest-derived module-to-package router, kernel/host reconciliation utilities, and pure module-list helpers, expressed as Hydra modules and generated into every self-hosting dialect. It builds on hydra-kernel.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hydra-kernel" or (errorHandler.buildDepError "hydra-kernel"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
        ];
        buildable = true;
      };
    };
  }