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
      identifier = { name = "diagrams-canvas"; version = "1.4.2.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "diagrams-discuss@googlegroups.com";
      author = "Jeffrey Rosenbluth, Ryan Yates, Brent Yorgey, Andy Gill, Daniel Bergey";
      homepage = "https://diagrams.github.io/";
      url = "";
      synopsis = "HTML5 canvas backend for diagrams drawing EDSL";
      description = "This package provides a modular backend for rendering\ndiagrams created with the diagrams EDSL using an\nHTML5 canvas.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."NumInstances" or (errorHandler.buildDepError "NumInstances"))
          (hsPkgs."diagrams-core" or (errorHandler.buildDepError "diagrams-core"))
          (hsPkgs."diagrams-lib" or (errorHandler.buildDepError "diagrams-lib"))
          (hsPkgs."blank-canvas" or (errorHandler.buildDepError "blank-canvas"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."statestack" or (errorHandler.buildDepError "statestack"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
        ];
        buildable = true;
      };
    };
  }