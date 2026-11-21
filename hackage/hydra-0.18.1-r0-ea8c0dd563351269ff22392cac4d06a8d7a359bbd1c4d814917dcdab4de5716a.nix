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
      identifier = { name = "hydra"; version = "0.18.1"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Joshua Shinavier <josh@fortytwo.net>";
      author = "Joshua Shinavier <josh@fortytwo.net>";
      homepage = "https://github.com/CategoricalData/hydra#readme";
      url = "";
      synopsis = "Hydra: graphs are programs, and programs are graphs (umbrella package)";
      description = "Hydra is an implementation of the LambdaGraph data model, which takes advantage of an isomorphism between labeled hypergraphs and typed lambda calculus: in Hydra, \"graphs are programs, and programs are graphs\". Hydra is an implementation of the LambdaGraph data model, which takes advantage of an isomorphism between labeled hypergraphs and typed lambda calculus: in Hydra, \"graphs are programs, and programs are graphs\". This umbrella package provides a single convenient entry point (the Hydra module) re-exporting the Hydra kernel plus the Haskell coder's moduleToHaskell. Depend on hydra-kernel / hydra-haskell directly for finer-grained APIs.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hydra-haskell" or (errorHandler.buildDepError "hydra-haskell"))
          (hsPkgs."hydra-kernel" or (errorHandler.buildDepError "hydra-kernel"))
        ];
        buildable = true;
      };
    };
  }