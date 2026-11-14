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
      identifier = { name = "jsaddle-webview2"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
      author = "Hamish Mackenzie";
      homepage = "";
      url = "";
      synopsis = "Interface for JavaScript that works with GHCJS and GHC";
      description = "jsaddle backend for Windows: hosts the app in a native Win32 window\ncontaining a Microsoft Edge WebView2 control.  The Windows sibling of\njsaddle-wkwebview (macOS/iOS) and jsaddle-webkitgtk (Linux).\n\nBuilding needs WebView2.h from the Microsoft.Web.WebView2 NuGet package\non the include path (see the README); nothing from the SDK is needed at\nlink time.  Running needs the WebView2 runtime (preinstalled on Windows\n11) and WebView2Loader.dll next to the executable.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        libs = [
          (pkgs."ole32" or (errorHandler.sysDepError "ole32"))
          (pkgs."user32" or (errorHandler.sysDepError "user32"))
        ];
        buildable = if !system.isWindows then false else true;
      };
      exes = {
        "jsaddle-webview2-demo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
            (hsPkgs."jsaddle-webview2" or (errorHandler.buildDepError "jsaddle-webview2"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !system.isWindows then false else true;
        };
      };
    };
  }