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
      specVersion = "1.6";
      identifier = { name = "mathlink"; version = "1.1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) Tracy Wadleigh 2008, 2009";
      maintainer = "<tracy.wadleigh@gmail.com>";
      author = "Tracy Wadleigh";
      homepage = "http://community.haskell.org/~TracyWadleigh/mathlink";
      url = "";
      synopsis = "Call Haskell from Mathematica";
      description = "Provides a simple way to expose Haskell functions to /Mathematica/ via the\n/MathLink/ interface.\n\nOne defines a Haskell function of type\n@('Expressible' e1, 'Expressible' e2) => e1 -> 'IO' e2@\nand provides a pair of 'String's that function analogously to the\n@:Pattern:@ and @:Arguments:@ directives for /Mathematica/'s @mprep@\nutility.\n\nThe library provides instances of the 'Expressible' class for many data\ntypes, including tuples, lists, arrays, and unboxed arrays.\n\nThe library does not use or require @foreign export@ declarations, so may\nbe used interactively.";
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