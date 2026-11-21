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
      identifier = { name = "hydra-jvm"; version = "0.18.1"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Joshua Shinavier <josh@fortytwo.net>";
      author = "Joshua Shinavier <josh@fortytwo.net>";
      homepage = "https://github.com/CategoricalData/hydra#readme";
      url = "";
      synopsis = "Shared JVM support for Hydra's Java, Scala, and Clojure coders";
      description = "Hydra is an implementation of the LambdaGraph data model, which takes advantage of an isomorphism between labeled hypergraphs and typed lambda calculus: in Hydra, \"graphs are programs, and programs are graphs\". Common JVM support for Hydra (shared by hydra-java, hydra-scala, hydra-clojure)";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hydra-kernel" or (errorHandler.buildDepError "hydra-kernel"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
        ];
        buildable = true;
      };
    };
  }