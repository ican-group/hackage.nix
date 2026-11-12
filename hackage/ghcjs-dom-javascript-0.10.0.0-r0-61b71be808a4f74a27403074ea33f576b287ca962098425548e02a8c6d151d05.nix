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
      identifier = { name = "ghcjs-dom-javascript"; version = "0.10.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
      author = "Hamish Mackenzie";
      homepage = "";
      url = "";
      synopsis = "DOM library using JSFFI and GHCJS";
      description = "Document Object Model (DOM) functions that work with\nGHCJS.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."ghcjs-base" or (errorHandler.buildDepError "ghcjs-base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
        ] ++ pkgs.lib.optional (compiler.isGhcjs && true) (hsPkgs."ghcjs-prim" or (errorHandler.buildDepError "ghcjs-prim"));
        buildable = if compiler.isGhcjs && true || system.isJavaScript
          then true
          else false;
      };
    };
  }