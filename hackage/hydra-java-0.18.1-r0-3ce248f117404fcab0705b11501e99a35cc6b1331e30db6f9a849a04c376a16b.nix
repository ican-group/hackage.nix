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
      identifier = { name = "hydra-java"; version = "0.18.1"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Joshua Shinavier <josh@fortytwo.net>";
      author = "Joshua Shinavier <josh@fortytwo.net>";
      homepage = "https://github.com/CategoricalData/hydra#readme";
      url = "";
      synopsis = "Hydra's Java coder: emit Java source from Hydra modules";
      description = "Hydra is an implementation of the LambdaGraph data model, which takes advantage of an isomorphism between labeled hypergraphs and typed lambda calculus: in Hydra, \"graphs are programs, and programs are graphs\". Java support for Hydra";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hydra-jvm" or (errorHandler.buildDepError "hydra-jvm"))
          (hsPkgs."hydra-kernel" or (errorHandler.buildDepError "hydra-kernel"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
        ];
        buildable = true;
      };
    };
  }