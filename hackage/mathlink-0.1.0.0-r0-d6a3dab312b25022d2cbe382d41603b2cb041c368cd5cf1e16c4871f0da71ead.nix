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
    flags = { "32bit" = false; };
    package = {
      specVersion = "1.2";
      identifier = { name = "mathlink"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) Tracy Wadleigh 2008, 2009";
      maintainer = "<tracy.wadleigh@gmail.com>";
      author = "Tracy Wadleigh";
      homepage = "";
      url = "";
      synopsis = "A library for Mathematica's MathLink";
      description = "Provides a simple way to expose Haskell functions to /Mathematica/ via the\n/MathLink/ interface. One defines a Haskell function of type @ML ()@ (a\n'Monad' built on top of 'IO') and provides a pair of 'String's that\nfunction analogously to the @:Pattern:@ and @:Arguments:@ directives for\n/Mathematica/'s @mprep@ utility. Data can be marshaled either as an\n'Expression' or, more generally, as an instance of the 'Expressible' class.\nThe library does not use or require @foreign export@ declarations, so may\nbe used interactively.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
        ];
        libs = if system.isI386 || flags."32bit"
          then [ (pkgs."ML32i3" or (errorHandler.sysDepError "ML32i3")) ]
          else [ (pkgs."ML64i3" or (errorHandler.sysDepError "ML64i3")) ];
        buildable = true;
      };
    };
  }