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
    flags = { doctest = false; };
    package = {
      specVersion = "1.12";
      identifier = { name = "jose-jwt-botan"; version = "0.12.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Steve Chavez <stevechavezast@gmail.com>";
      author = "Luke Taylor <tekul.hs@gmail.com>";
      homepage = "https://github.com/PostgREST/jose-jwt-botan";
      url = "";
      synopsis = "JSON Object Signing and Encryption Library using Botan";
      description = "\nAn implementation of the JOSE suite of IETF standards\nand the closely related JWT (JSON web token) spec\n(<https://tools.ietf.org/html/rfc7519/>).\n\nBoth signed and encrypted JWTs are supported, as well as simple\nJWK keys.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = pkgs.lib.optionals (!(compiler.isGhc && compiler.version.lt "8.0")) [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."botan-low" or (errorHandler.buildDepError "botan-low"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = if compiler.isGhc && compiler.version.lt "8.0"
          then false
          else true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."jose-jwt-botan" or (errorHandler.buildDepError "jose-jwt-botan"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
        "doctests" = {
          depends = pkgs.lib.optionals (!!flags.doctest) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          ];
          buildable = if !flags.doctest then false else true;
        };
      };
      benchmarks = {
        "bench-jwt" = {
          depends = [
            (hsPkgs."jose-jwt-botan" or (errorHandler.buildDepError "jose-jwt-botan"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          ];
          buildable = true;
        };
        "loadtest-jwt" = {
          depends = [
            (hsPkgs."jose-jwt-botan" or (errorHandler.buildDepError "jose-jwt-botan"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          ];
          buildable = true;
        };
      };
    };
  }