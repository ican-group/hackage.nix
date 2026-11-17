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
      specVersion = "3.14";
      identifier = { name = "vmodel"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "harley@harleyeades.com";
      author = "Harley D. Eades III";
      homepage = "";
      url = "";
      synopsis = "Types for frontend view models";
      description = "A library of types for common structures used to model user interfaces";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
      tests = {
        "vmodel-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."vmodel" or (errorHandler.buildDepError "vmodel"))
          ];
          buildable = true;
        };
      };
    };
  }