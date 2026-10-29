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
      specVersion = "2.4";
      identifier = { name = "plegg"; version = "0.2.1.3"; };
      license = "Unlicense";
      copyright = "(c) Varik Valefor 2026.  No rights reserved.";
      maintainer = "varikvalefor@aol.com";
      author = "Varik Valefor";
      homepage = "";
      url = "";
      synopsis = "A semi-cross-platform interface for pledge(2) and unveil(2)";
      description = "plegg offers a simple Haskell interface for OpenBSD's\npledge(2) and unveil(2).  A useless but non-crashing\nthing is the result of compiling (on a non-OpenBSD\noperating system) the interface.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }