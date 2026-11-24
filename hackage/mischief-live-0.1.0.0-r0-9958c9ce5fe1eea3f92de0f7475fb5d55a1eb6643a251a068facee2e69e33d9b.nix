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
      identifier = { name = "mischief-live"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "pvdoriginal2019@gmail.com";
      author = "Damon";
      homepage = "https://codeberg.org/mischief/mischief";
      url = "";
      synopsis = "Live Coding for the Mischief Game Engine.";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."fsnotify" or (errorHandler.buildDepError "fsnotify"))
          (hsPkgs."hint" or (errorHandler.buildDepError "hint"))
          (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      sublibs = {
        "example-simple-common" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
          ];
          buildable = true;
        };
        "example-simple-live" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-live".components.sublibs.example-simple-common or (errorHandler.buildDepError "mischief-live:example-simple-common"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "example-shader-common" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
          ];
          buildable = true;
        };
        "example-shader-live" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-live".components.sublibs.example-shader-common or (errorHandler.buildDepError "mischief-live:example-shader-common"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      exes = {
        "example-simple" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."hint" or (errorHandler.buildDepError "hint"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-live" or (errorHandler.buildDepError "mischief-live"))
            (hsPkgs."mischief-live".components.sublibs.example-simple-common or (errorHandler.buildDepError "mischief-live:example-simple-common"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "example-shader" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."hint" or (errorHandler.buildDepError "hint"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-live" or (errorHandler.buildDepError "mischief-live"))
            (hsPkgs."mischief-live".components.sublibs.example-shader-common or (errorHandler.buildDepError "mischief-live:example-shader-common"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }