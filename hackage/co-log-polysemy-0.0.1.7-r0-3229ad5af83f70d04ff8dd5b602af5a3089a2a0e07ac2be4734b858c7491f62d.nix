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
      specVersion = "2.4";
      identifier = { name = "co-log-polysemy"; version = "0.0.1.7"; };
      license = "MPL-2.0";
      copyright = "2019-2020 Kowainik, 2021-2026 Co-Log";
      maintainer = "Kowainik <xrom.xkov@gmail.com>";
      author = "Dmitrii Kovanikov";
      homepage = "https://github.com/co-log/co-log-polysemy";
      url = "";
      synopsis = "Composable Contravariant Comonadic Logging Library";
      description = "Implementation of the [co-log](http://hackage.haskell.org/package/co-log-core)\nlogging based on the [polysemy](http://hackage.haskell.org/package/polysemy)\nextensible effects library.\n\nThe ideas behind this package are described in the following blog post:\n\n* [co-log: Composable Contravariant Combinatorial Comonadic Configurable Convenient Logging](https://kowainik.github.io/posts/2018-09-25-co-log)\n\nFor the taggless final implementation of the @co-log@ ideas se the following package:\n\n* [co-log](http://hackage.haskell.org/package/co-log)";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."co-log-core" or (errorHandler.buildDepError "co-log-core"))
          (hsPkgs."polysemy" or (errorHandler.buildDepError "polysemy"))
        ];
        buildable = true;
      };
      exes = {
        "play-colog-poly" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."co-log-core" or (errorHandler.buildDepError "co-log-core"))
            (hsPkgs."co-log-polysemy" or (errorHandler.buildDepError "co-log-polysemy"))
            (hsPkgs."polysemy" or (errorHandler.buildDepError "polysemy"))
          ];
          buildable = true;
        };
      };
    };
  }