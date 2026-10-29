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
      identifier = { name = "matrix-accelerate"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2024 Noah Williams";
      maintainer = "noahmartinwilliams@gmail.com";
      author = "Noah Martin Williams";
      homepage = "https://github.com/noahmartinwilliams/matrix-accelerate#readme";
      url = "";
      synopsis = "An accelerate library that adds dependently typed matrices.";
      description = "An accelerate library that adds dependently typed matrices. This library adds the ability to do matrix manipulations with or without dependent types to help line up the operations so as to prevent runtime errors.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."accelerate" or (errorHandler.buildDepError "accelerate"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."lens-accelerate" or (errorHandler.buildDepError "lens-accelerate"))
        ];
        buildable = true;
      };
      tests = {
        "accelerate-matrix-test" = {
          depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = true;
        };
      };
    };
  }