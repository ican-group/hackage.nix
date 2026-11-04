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
      identifier = { name = "brillo-algorithms"; version = "2.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "brillo@ad-si.com";
      author = "Ben Lippmeier, Adrian Sieber";
      homepage = "https://github.com/ad-si/Brillo";
      url = "";
      synopsis = "Data structures and algorithms for working with 2D graphics.";
      description = "Data structures and algorithms for working with 2D graphics.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
        ];
        buildable = true;
      };
    };
  }