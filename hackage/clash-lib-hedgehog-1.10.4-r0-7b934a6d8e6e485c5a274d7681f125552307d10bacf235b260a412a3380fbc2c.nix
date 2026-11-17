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
      identifier = { name = "clash-lib-hedgehog"; version = "1.10.4"; };
      license = "BSD-2-Clause";
      copyright = "Copyright © 2021-2026, QBayLogic B.V.";
      maintainer = "devops@qbaylogic.com";
      author = "QBayLogic B.V.";
      homepage = "";
      url = "";
      synopsis = "Hedgehog Generators for clash-lib";
      description = "Hedgehog Generators for clash-lib";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."fakedata" or (errorHandler.buildDepError "fakedata"))
          (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
          (hsPkgs."ghc-typelits-natnormalise" or (errorHandler.buildDepError "ghc-typelits-natnormalise"))
          (hsPkgs."hedgehog-fakedata" or (errorHandler.buildDepError "hedgehog-fakedata"))
          (hsPkgs."mmorph" or (errorHandler.buildDepError "mmorph"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."pretty-show" or (errorHandler.buildDepError "pretty-show"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."clash-lib" or (errorHandler.buildDepError "clash-lib"))
        ];
        buildable = true;
      };
    };
  }