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
      identifier = { name = "glue-example"; version = "0.8.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "github@futurenotfound.com";
      author = "Sean Parsons";
      homepage = "";
      url = "";
      synopsis = "Make better services and clients.";
      description = "Examples of the use of glue library functionality.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "glue-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ekg-core" or (errorHandler.buildDepError "ekg-core"))
            (hsPkgs."glue-common" or (errorHandler.buildDepError "glue-common"))
            (hsPkgs."glue-core" or (errorHandler.buildDepError "glue-core"))
            (hsPkgs."glue-ekg" or (errorHandler.buildDepError "glue-ekg"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = true;
        };
      };
    };
  }