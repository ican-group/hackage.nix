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
      identifier = { name = "brillo"; version = "3.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "brillo@ad-si.com";
      author = "Ben Lippmeier, Adrian Sieber";
      homepage = "https://github.com/ad-si/Brillo";
      url = "";
      synopsis = "Painless 2D vector graphics, animations, and simulations powered by GLFW";
      description = "Brillo hides the pain of drawing simple vector graphics\nbehind a nice data type and a few display functions.\nBrillo uses GLFW and OpenGL under the hood,\nbut you won't need to worry about any of that.\nGet something cool on the screen in under 10 minutes.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brillo-rendering" or (errorHandler.buildDepError "brillo-rendering"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
          (hsPkgs."OpenGL" or (errorHandler.buildDepError "OpenGL"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        libs = pkgs.lib.optionals (system.isWindows) [
          (pkgs."comdlg32" or (errorHandler.sysDepError "comdlg32"))
          (pkgs."ole32" or (errorHandler.sysDepError "ole32"))
          (pkgs."shell32" or (errorHandler.sysDepError "shell32"))
          (pkgs."user32" or (errorHandler.sysDepError "user32"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.c2hs.components.exes.c2hs or (pkgs.pkgsBuildBuild.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
        ];
        buildable = true;
      };
    };
  }