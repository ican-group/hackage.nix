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
      identifier = { name = "monoidmap-internal"; version = "0.4.0.0"; };
      license = "Apache-2.0";
      copyright = "2022–2026 Jonathan Knowles";
      maintainer = "mail@jonathanknowles.net";
      author = "Jonathan Knowles";
      homepage = "https://github.com/jonathanknowles/monoidmap/tree/HEAD/packages/monoidmap-internal";
      url = "";
      synopsis = "Internal support for monoidmap.";
      description = "Internal support for the monoidmap package.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."monoid-subclasses" or (errorHandler.buildDepError "monoid-subclasses"))
          (hsPkgs."nothunks" or (errorHandler.buildDepError "nothunks"))
        ];
        buildable = true;
      };
      benchmarks = {
        "monoidmap-internal-benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."monoidmap-internal" or (errorHandler.buildDepError "monoidmap-internal"))
          ];
          buildable = true;
        };
      };
    };
  }