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
      identifier = { name = "mischief"; version = "0.1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "pvdoriginal2019@gmail.com";
      author = "Damon";
      homepage = "https://codeberg.org/mischief/mischief";
      url = "";
      synopsis = "The Haskell Game Engine (with rats).";
      description = "Mischief is an ECS-based game engine written in Haskell. It provides\na refreshing, fun experience to game devs, whether or not they are familiar with Haskell\nor ECS.\n\nIt makes use of both data-oriented and functional paradigms to create a weird but clean API\nthat gives you easy control over the flow of data in your games.\n\nIt is decentralized, meaning you are able to easily experiment with various libraries.\n\nMischief puts creativity, human expression, and fun above anything else.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
          (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
          (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
          (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
          (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
          (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
        ];
        buildable = true;
      };
      exes = {
        "example-rat-picker" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }