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
    flags = { warp = true; webkitgtk = true; webkit2gtk = true; };
    package = {
      specVersion = "1.24";
      identifier = { name = "ghcjs-dom-hello"; version = "6.0.0.2"; };
      license = "MIT";
      copyright = "(c) Hamish Mackenzie";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@gmail.com>";
      author = "Hamish Mackenzie";
      homepage = "https://github.com/ghcjs/ghcjs-dom-hello";
      url = "";
      synopsis = "GHCJS DOM Hello World, an example package";
      description = "This is an implementation of the classic \"Hello World\" program using GHCJS DOM,\nas an example of how to create a minimal GHCJS DOM application.\nPlease submit any suggestions and improvements.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghcjs-dom" or (errorHandler.buildDepError "ghcjs-dom"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
        ] ++ pkgs.lib.optionals (!(compiler.isGhcjs && true) && !system.isJavaScript) [
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
          (hsPkgs."jsaddle-warp" or (errorHandler.buildDepError "jsaddle-warp"))
        ];
        buildable = true;
      };
      exes = {
        "ghcjs-dom-hello" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghcjs-dom-hello" or (errorHandler.buildDepError "ghcjs-dom-hello"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ] ++ pkgs.lib.optionals (!(compiler.isGhcjs && true) && !system.isJavaScript) (if system.isOsx || system.isIOS
            then [
              (hsPkgs."jsaddle-wkwebview" or (errorHandler.buildDepError "jsaddle-wkwebview"))
            ]
            else if flags.webkit2gtk
              then [
                (hsPkgs."jsaddle-webkit2gtk" or (errorHandler.buildDepError "jsaddle-webkit2gtk"))
              ]
              else [
                (hsPkgs."jsaddle-webkitgtk" or (errorHandler.buildDepError "jsaddle-webkitgtk"))
              ]);
          buildable = true;
        };
        "ghcjs-dom-hello-warp" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghcjs-dom" or (errorHandler.buildDepError "ghcjs-dom"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."ghcjs-dom-hello" or (errorHandler.buildDepError "ghcjs-dom-hello"))
            (hsPkgs."jsaddle-warp" or (errorHandler.buildDepError "jsaddle-warp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
          buildable = if !flags.warp || compiler.isGhcjs && true || system.isJavaScript || system.isIOS
            then false
            else true;
        };
        "ghcjs-dom-hello-webkitgtk" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghcjs-dom-hello" or (errorHandler.buildDepError "ghcjs-dom-hello"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ] ++ (if flags.webkit2gtk
            then [
              (hsPkgs."jsaddle-webkit2gtk" or (errorHandler.buildDepError "jsaddle-webkit2gtk"))
            ]
            else [
              (hsPkgs."jsaddle-webkitgtk" or (errorHandler.buildDepError "jsaddle-webkitgtk"))
            ]);
          buildable = if !flags.webkitgtk || compiler.isGhcjs && true || system.isJavaScript || system.isIOS || system.isOsx
            then false
            else true;
        };
        "ghcjs-dom-hello-wkwebview" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghcjs-dom-hello" or (errorHandler.buildDepError "ghcjs-dom-hello"))
            (hsPkgs."jsaddle-wkwebview" or (errorHandler.buildDepError "jsaddle-wkwebview"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
          buildable = if !system.isOsx || compiler.isGhcjs && true || system.isJavaScript
            then false
            else true;
        };
      };
    };
  }