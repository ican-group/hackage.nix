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
      identifier = { name = "mathlink"; version = "1.0.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) Tracy Wadleigh 2008, 2009";
      maintainer = "<tracy.wadleigh@gmail.com>";
      author = "Tracy Wadleigh";
      homepage = "http://community.haskell.org/~TracyWadleigh/mathlink";
      url = "";
      synopsis = "Call Haskell from Mathematica";
      description = "Provides a simple way to expose Haskell functions to /Mathematica/ via the\n/MathLink/ interface.\n\nOne defines a Haskell function of type @IO ()@ and provides a pair of\n'String's that function analogously to the @:Pattern:@ and @:Arguments:@\ndirectives for /Mathematica/'s @mprep@ utility.\n\nData whose types are instances of the 'Expressible' class can be marshaled\nto\\/from /Mathematica/. The library already provides instances for many\ndata types, including tuples, lists, and unboxed arrays.\n\nThe library does not use or require @foreign export@ declarations, so may\nbe used interactively.";
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