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
      identifier = { name = "mono-hash"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "me@philipphagenlocher.de";
      author = "Philipp Hagenlocher";
      homepage = "https://github.com/phagenlocher/mono-hash#readme";
      url = "";
      synopsis = "Hashing for monomorphic containers.";
      description = "FNV, SipHash, and HalfSipHash hashing for monomorphic containers.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mono-traversable" or (errorHandler.buildDepError "mono-traversable"))
          (hsPkgs."wide-word" or (errorHandler.buildDepError "wide-word"))
        ];
        buildable = true;
      };
      tests = {
        "mono-hash-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."mono-hash" or (errorHandler.buildDepError "mono-hash"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wide-word" or (errorHandler.buildDepError "wide-word"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "mono-hash-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."mono-hash" or (errorHandler.buildDepError "mono-hash"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wide-word" or (errorHandler.buildDepError "wide-word"))
          ];
          buildable = true;
        };
      };
    };
  }