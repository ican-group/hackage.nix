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
      specVersion = "2.2";
      identifier = { name = "jsaddle-dom"; version = "0.10.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
      author = "Hamish Mackenzie";
      homepage = "";
      url = "";
      synopsis = "DOM library that uses jsaddle to support both GHCJS and GHC";
      description = "Documentent Object Model (DOM) functions implemented using jsaddle.\nIt works with both GHCJS and GHC.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
        ] ++ pkgs.lib.optionals (compiler.isGhcjs && true) [
          (hsPkgs."ghcjs-base" or (errorHandler.buildDepError "ghcjs-base"))
          (hsPkgs."ghcjs-prim" or (errorHandler.buildDepError "ghcjs-prim"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
        ]) ++ pkgs.lib.optional (system.isJavaScript) (hsPkgs."ghcjs-base" or (errorHandler.buildDepError "ghcjs-base"));
        buildable = true;
      };
    };
  }