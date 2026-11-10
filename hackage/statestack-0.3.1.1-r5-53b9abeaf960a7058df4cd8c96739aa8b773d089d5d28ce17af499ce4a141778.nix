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
      specVersion = "1.10";
      identifier = { name = "statestack"; version = "0.3.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "byorgey@gmail.com";
      author = "Brent Yorgey";
      homepage = "";
      url = "";
      synopsis = "Simple State-like monad transformer with saveable and restorable state";
      description = "Simple State-like monad transformer where states can be saved to\nand restored from an internal stack.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
    };
  }