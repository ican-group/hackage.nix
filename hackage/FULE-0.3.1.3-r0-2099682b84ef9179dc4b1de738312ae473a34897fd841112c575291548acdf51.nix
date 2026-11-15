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
      specVersion = "1.12";
      identifier = { name = "FULE"; version = "0.3.1.3"; };
      license = "BSD-3-Clause";
      copyright = "2022-2025 Paul Schnapp";
      maintainer = "paul.schnapp@gmail.com";
      author = "Paul Schnapp";
      homepage = "https://github.com/pschnapp/FULE#readme";
      url = "";
      synopsis = "Functional UI Layout Engine";
      description = "Please see the README on GitHub at <https://github.com/pschnapp/FULE#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
      tests = {
        "FULE-test" = {
          depends = [
            (hsPkgs."FULE" or (errorHandler.buildDepError "FULE"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
      };
    };
  }