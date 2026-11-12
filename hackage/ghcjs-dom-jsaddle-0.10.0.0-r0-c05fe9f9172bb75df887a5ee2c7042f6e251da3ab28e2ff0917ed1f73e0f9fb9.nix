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
      specVersion = "3.6";
      identifier = { name = "ghcjs-dom-jsaddle"; version = "0.10.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
      author = "Hamish Mackenzie";
      homepage = "";
      url = "";
      synopsis = "DOM library that supports both GHCJS and GHC using jsaddle";
      description = "Document Object Model (DOM) functions that work with\nGHCJS, but can also be used with GHC and a Browser.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."jsaddle-dom" or (errorHandler.buildDepError "jsaddle-dom"))
        ];
        buildable = true;
      };
    };
  }