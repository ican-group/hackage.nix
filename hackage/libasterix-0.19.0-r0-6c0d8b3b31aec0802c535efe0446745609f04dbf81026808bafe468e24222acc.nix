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
      identifier = { name = "libasterix"; version = "0.19.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "zoran.bosnjak@via.si";
      author = "Zoran Bošnjak";
      homepage = "https://github.com/zoranbosnjak/asterix-libs/tree/main/libs/haskell";
      url = "";
      synopsis = "Asterix data processing library";
      description = "This library provides features to process asterix data format, including\nparsing, unparsing, constructing and manipulating asterix records.\n\nAsterix data format is a set of specifications, defined by Eurocontrol.\nIt is mostly used for exchanging surveillance related information in air\ntraffic control applications.\n\nFor more details and tutorial see\n<https://github.com/zoranbosnjak/asterix-libs/tree/main/libs/haskell#readme the readme>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      tests = {
        "libasterix-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."libasterix" or (errorHandler.buildDepError "libasterix"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."base16" or (errorHandler.buildDepError "base16"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }