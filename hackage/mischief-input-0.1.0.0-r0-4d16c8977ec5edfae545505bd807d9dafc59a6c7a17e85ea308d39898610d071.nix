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
      identifier = { name = "mischief-input"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "pvdoriginal2019@gmail.com";
      author = "Damon";
      homepage = "https://codeberg.org/mischief/mischief";
      url = "";
      synopsis = "Input for the Mischief game engine";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
          (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
        ];
        buildable = true;
      };
      tests = {
        "mischief-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
      };
    };
  }