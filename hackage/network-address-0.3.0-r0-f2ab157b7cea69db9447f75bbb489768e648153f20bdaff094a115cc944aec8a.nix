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
    flags = { benchmark = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "network-address"; version = "0.3.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "sebnow@gmail.com";
      author = "Sebastian Nowicki";
      homepage = "http://github.com/sebnow/haskell-network-address";
      url = "";
      synopsis = "IP data structures and textual representation";
      description = "A library for parsing, representing, computing and\ntransforming network addresses such a IPv4, IPv6\nand subnetworks.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
      exes = {
        "benchmark" = {
          depends = pkgs.lib.optionals (flags.benchmark) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ];
          buildable = if flags.benchmark then true else false;
        };
      };
      tests = {
        "test-package" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
          ];
          buildable = true;
        };
      };
    };
  }