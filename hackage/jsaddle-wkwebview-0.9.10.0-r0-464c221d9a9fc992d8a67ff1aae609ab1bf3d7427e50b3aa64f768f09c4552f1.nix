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
    flags = { include-app-delegate = true; objc-in-library = true; };
    package = {
      specVersion = "3.0";
      identifier = { name = "jsaddle-wkwebview"; version = "0.9.10.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
      author = "Hamish Mackenzie";
      homepage = "";
      url = "";
      synopsis = "Interface for JavaScript that works with GHCJS and GHC";
      description = "This package provides an EDSL for calling JavaScript that\ncan be used both from GHCJS and GHC.  When using GHC\nthe application is run using Warp and WebSockets to\ndrive a small JavaScipt helper.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
        ] ++ pkgs.lib.optionals (!(compiler.isGhcjs && true || system.isJavaScript)) [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        frameworks = pkgs.lib.optionals (!(compiler.isGhcjs && true || system.isJavaScript)) ([
          (pkgs."Foundation" or (errorHandler.sysDepError "Foundation"))
          (pkgs."WebKit" or (errorHandler.sysDepError "WebKit"))
        ] ++ (if system.isIOS
          then [
            (pkgs."UIKit" or (errorHandler.sysDepError "UIKit"))
            (pkgs."UserNotifications" or (errorHandler.sysDepError "UserNotifications"))
          ]
          else [ (pkgs."Cocoa" or (errorHandler.sysDepError "Cocoa")) ]));
        buildable = if !system.isOsx && !system.isIOS && !(compiler.isGhcjs && true) && !system.isJavaScript
          then false
          else true;
      };
    };
  }