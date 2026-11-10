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
      specVersion = "3.12";
      identifier = { name = "lipstick-brick"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "andrea@bedini.au";
      author = "Andrea Bedini";
      homepage = "https://github.com/andreabedini/lipstick";
      url = "";
      synopsis = "Show lipstick blocks in brick and vty applications";
      description = "Turn lipstick blocks into vty images and brick widgets, so styles, tables,\nlists and trees made with lipstick can be shown in terminal user interfaces.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."lipstick" or (errorHandler.buildDepError "lipstick"))
          (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
          (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
        ];
        buildable = true;
      };
      tests = {
        "lipstick-brick-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lipstick" or (errorHandler.buildDepError "lipstick"))
            (hsPkgs."lipstick-brick" or (errorHandler.buildDepError "lipstick-brick"))
            (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
            (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }