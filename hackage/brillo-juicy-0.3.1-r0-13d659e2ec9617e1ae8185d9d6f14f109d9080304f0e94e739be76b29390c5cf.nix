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
      identifier = { name = "brillo-juicy"; version = "0.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Adrian Sieber";
      author = "Alp Mestanogullari <alpmestan@gmail.com>, Adrian Sieber";
      homepage = "https://github.com/ad-si/Brillo";
      url = "";
      synopsis = "Load any image supported by Juicy.Pixels in your brillo application";
      description = "Lets you convert any image supported by Juicy.Pixels in a brillo application\nby converting to brillo' Bitmap representation.\nVersion 0.1.2 just enabled caching (from a frame to the next, and so on)\nof the images you load, so that they are not recomputed for each frame.\nCredits go to Jonathan Daugherty for the patch.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."webp" or (errorHandler.buildDepError "webp"))
        ];
        buildable = true;
      };
      exes = {
        "brillo-juicy-viewer" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."webp" or (errorHandler.buildDepError "webp"))
          ];
          buildable = true;
        };
      };
    };
  }