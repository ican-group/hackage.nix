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
      specVersion = "2.2";
      identifier = { name = "universe-base"; version = "1.1.4"; };
      license = "BSD-3-Clause";
      copyright = "2014 Daniel Wagner";
      maintainer = "me@dmwit.com";
      author = "Daniel Wagner";
      homepage = "https://github.com/dmwit/universe";
      url = "";
      synopsis = "A class for finite and recursively enumerable types.";
      description = "A class for finite and recursively enumerable types and some helper functions for enumerating them.\n\n@\nclass Universe a where universe :: [a]\nclass Universe a => Finite a where universeF :: [a]; universeF = universe\n@\n\nThis is slim package definiting only the type-classes and instances\nfor types in GHC boot libraries.\nFor more instances check @universe-instances-*@ packages.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ] ++ pkgs.lib.optionals (!(compiler.isGhc && compiler.version.ge "9.2")) (if compiler.isGhc && compiler.version.ge "9.0"
          then [
            (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          ]
          else [
            (hsPkgs."OneTuple" or (errorHandler.buildDepError "OneTuple"))
          ]);
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."universe-base" or (errorHandler.buildDepError "universe-base"))
          ];
          buildable = true;
        };
      };
    };
  }