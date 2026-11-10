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
      identifier = { name = "apecs-brillo"; version = "0.2.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2017 Jonas Carpay, Execute";
      maintainer = "Execute";
      author = "Execute";
      homepage = "";
      url = "";
      synopsis = "Apecs' gloss package, but adapted for brillo.";
      description = "A library that's meant to bridge the gap between brillo and apecs.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."apecs" or (errorHandler.buildDepError "apecs"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
          (hsPkgs."brillo-rendering" or (errorHandler.buildDepError "brillo-rendering"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
        ];
        buildable = true;
      };
      exes = {
        "example-balls" = {
          depends = [
            (hsPkgs."apecs" or (errorHandler.buildDepError "apecs"))
            (hsPkgs."apecs-brillo" or (errorHandler.buildDepError "apecs-brillo"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."brillo-rendering" or (errorHandler.buildDepError "brillo-rendering"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          ];
          buildable = true;
        };
      };
      tests = {
        "apecs-brillo-test" = {
          depends = [
            (hsPkgs."apecs" or (errorHandler.buildDepError "apecs"))
            (hsPkgs."apecs-brillo" or (errorHandler.buildDepError "apecs-brillo"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."brillo-rendering" or (errorHandler.buildDepError "brillo-rendering"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          ];
          buildable = true;
        };
      };
    };
  }