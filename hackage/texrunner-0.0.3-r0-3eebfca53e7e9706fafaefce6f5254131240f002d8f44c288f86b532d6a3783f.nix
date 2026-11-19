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
      specVersion = "1.10";
      identifier = { name = "texrunner"; version = "0.0.3"; };
      license = "BSD-3-Clause";
      copyright = "2015 Christopher Chalmers";
      maintainer = "c.chalmers@me.com";
      author = "Christopher Chalmers";
      homepage = "";
      url = "";
      synopsis = "Functions for running Tex from Haskell.";
      description = "texrunner is an interface to tex that attempts to parse errors and\ncan parse tex in online mode to retrieve hbox sizes.\n\nThis package should be considered very experimental. Eventually I hope\nit will be good enough for general use but for now it's only suitable\nfor simple things.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."texrunner" or (errorHandler.buildDepError "texrunner"))
          ];
          buildable = true;
        };
      };
    };
  }