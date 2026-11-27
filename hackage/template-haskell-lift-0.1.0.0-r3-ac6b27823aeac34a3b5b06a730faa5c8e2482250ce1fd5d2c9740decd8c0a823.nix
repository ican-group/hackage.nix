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
      identifier = { name = "template-haskell-lift"; version = "0.1.0.0"; };
      license = "BSD-2-Clause";
      copyright = "template-haskell-lift contributors";
      maintainer = "Teo Camarasu <teofilcamarasu@gmail.com>, GHC developers <ghc-devs@haskell.org>";
      author = "Teo Camarasu";
      homepage = "";
      url = "";
      synopsis = "The 'Lift' typeclass.";
      description = "The stable home of TemplateHaskell's 'Lift' typeclass, which implements cross-stage persistence for Template Haskell.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
        ] ++ (if compiler.isGhc && compiler.version.ge "9.12"
          then [
            (hsPkgs."ghc-internal" or (errorHandler.buildDepError "ghc-internal"))
          ]
          else [
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ]);
        buildable = true;
      };
    };
  }