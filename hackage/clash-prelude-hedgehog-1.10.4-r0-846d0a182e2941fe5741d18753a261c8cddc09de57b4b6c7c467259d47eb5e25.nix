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
      identifier = { name = "clash-prelude-hedgehog"; version = "1.10.4"; };
      license = "BSD-2-Clause";
      copyright = "Copyright © 2021-2026, QBayLogic B.V.";
      maintainer = "devops@qbaylogic.com";
      author = "QBayLogic B.V.";
      homepage = "";
      url = "";
      synopsis = "Hedgehog Generators for clash-prelude";
      description = "Hedgehog Generators for clash-prelude";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
          (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
          (hsPkgs."ghc-typelits-natnormalise" or (errorHandler.buildDepError "ghc-typelits-natnormalise"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
          (hsPkgs."clash-prelude" or (errorHandler.buildDepError "clash-prelude"))
        ];
        buildable = true;
      };
    };
  }