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
      identifier = { name = "brillo-rendering"; version = "3.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "brillo@ad-si.com";
      author = "Elise Huard, Ben Lippmeier, Adrian Sieber";
      homepage = "";
      url = "";
      synopsis = "Brillo picture data types and rendering functions.";
      description = "Brillo picture data types and rendering functions.\nThese functions don't do any window management.\nIf you want Brillo to setup your window as well,\nthen use the plain @brillo@ package.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bmp" or (errorHandler.buildDepError "bmp"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."freetype2" or (errorHandler.buildDepError "freetype2"))
          (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
          (hsPkgs."OpenGL" or (errorHandler.buildDepError "OpenGL"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
    };
  }