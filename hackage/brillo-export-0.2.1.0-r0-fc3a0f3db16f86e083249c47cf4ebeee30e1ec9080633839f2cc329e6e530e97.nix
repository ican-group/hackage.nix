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
      identifier = { name = "brillo-export"; version = "0.2.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "timo-a@gmx.ch";
      author = "Timo A";
      homepage = "https://github.com/ad-si/Brillo";
      url = "";
      synopsis = "Export Brillo pictures to png, bmp, tga, tiff, gif, svg and juicy-pixels-image";
      description = "Export Brillo pictures to various image formats including PNG, BMP, TGA, TIFF, animated GIF, and SVG.\nForked from gloss-export and adapted for the Brillo graphics library.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brillo-rendering" or (errorHandler.buildDepError "brillo-rendering"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
          (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
          (hsPkgs."OpenGLRaw" or (errorHandler.buildDepError "OpenGLRaw"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."webp" or (errorHandler.buildDepError "webp"))
        ];
        buildable = true;
      };
      exes = {
        "brillo-export-exe" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."brillo-export" or (errorHandler.buildDepError "brillo-export"))
          ];
          buildable = true;
        };
      };
      tests = {
        "brillo-export-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."brillo-export" or (errorHandler.buildDepError "brillo-export"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "brillo-svg-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."brillo-export" or (errorHandler.buildDepError "brillo-export"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "brillo-webp-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."brillo-export" or (errorHandler.buildDepError "brillo-export"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }