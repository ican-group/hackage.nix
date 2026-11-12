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
      identifier = { name = "jsaddle-webkitgtk"; version = "0.10.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
      author = "Hamish Mackenzie";
      homepage = "";
      url = "";
      synopsis = "Interface for JavaScript that works with GHCJS and GHC";
      description = "jsaddle backend hosting the app in a GTK4 window containing a\nWebKitGTK 6.0 WebView (gi-gtk4 / gi-webkit 6.x).  The modern\nreplacement for jsaddle-webkit2gtk (GTK3 / webkit2gtk 4.0, which has\nbeen removed from nixpkgs).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
        ] ++ pkgs.lib.optionals (!(compiler.isGhcjs && true) && !system.isJavaScript) [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."gi-glib" or (errorHandler.buildDepError "gi-glib"))
          (hsPkgs."gi-gio" or (errorHandler.buildDepError "gi-gio"))
          (hsPkgs."gi-gtk4" or (errorHandler.buildDepError "gi-gtk4"))
          (hsPkgs."gi-webkit" or (errorHandler.buildDepError "gi-webkit"))
          (hsPkgs."gi-javascriptcore6" or (errorHandler.buildDepError "gi-javascriptcore6"))
          (hsPkgs."haskell-gi-base" or (errorHandler.buildDepError "haskell-gi-base"))
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ]) ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
        buildable = if !system.isLinux && !(compiler.isGhcjs && true) && !system.isJavaScript
          then false
          else true;
      };
      exes = {
        "jsaddle-webkitgtk-demo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
            (hsPkgs."jsaddle-webkitgtk" or (errorHandler.buildDepError "jsaddle-webkitgtk"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          buildable = if !system.isLinux then false else true;
        };
      };
    };
  }