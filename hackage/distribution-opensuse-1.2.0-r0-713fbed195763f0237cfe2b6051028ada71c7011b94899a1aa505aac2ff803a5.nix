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
      identifier = { name = "distribution-opensuse"; version = "1.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "simons@cryp.to";
      author = "Peter Simons";
      homepage = "https://github.com/peti/distribution-opensuse/";
      url = "";
      synopsis = "Types, functions, and tools to manipulate the openSUSE distribution";
      description = "This library is a loose collection of types, functions, and tools that\nusers and developers of the\n<https://opensuse.org/ openSUSE Linux distribution> might find useful.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Diff" or (errorHandler.buildDepError "Diff"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          (hsPkgs."foldl" or (errorHandler.buildDepError "foldl"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."hsemail" or (errorHandler.buildDepError "hsemail"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."parsec-class" or (errorHandler.buildDepError "parsec-class"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."turtle" or (errorHandler.buildDepError "turtle"))
        ];
        buildable = true;
      };
      exes = {
        "guess-changelog" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."distribution-opensuse" or (errorHandler.buildDepError "distribution-opensuse"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."turtle" or (errorHandler.buildDepError "turtle"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test-strip-space" = {
          depends = [
            (hsPkgs."distribution-opensuse" or (errorHandler.buildDepError "distribution-opensuse"))
          ];
          buildable = true;
        };
      };
    };
  }