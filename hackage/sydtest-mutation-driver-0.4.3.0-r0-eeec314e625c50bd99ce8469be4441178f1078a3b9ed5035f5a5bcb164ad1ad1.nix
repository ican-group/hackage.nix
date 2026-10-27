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
      identifier = { name = "sydtest-mutation-driver"; version = "0.4.3.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "syd@cs-syd.eu";
      author = "Tom Sydney Kerckhove";
      homepage = "https://github.com/NorfairKing/sydtest#readme";
      url = "";
      synopsis = "Out-of-process mutation testing driver for sydtest.";
      description = "Standalone driver executable that orchestrates the coverage and mutation phases of sydtest's mutation testing infrastructure. Spawns instrumented sydtest test suite executables as children.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."opt-env-conf" or (errorHandler.buildDepError "opt-env-conf"))
          (hsPkgs."path" or (errorHandler.buildDepError "path"))
          (hsPkgs."path-io" or (errorHandler.buildDepError "path-io"))
          (hsPkgs."safe-coloured-text" or (errorHandler.buildDepError "safe-coloured-text"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."sydtest" or (errorHandler.buildDepError "sydtest"))
          (hsPkgs."sydtest-mutation-runtime" or (errorHandler.buildDepError "sydtest-mutation-runtime"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."typed-process" or (errorHandler.buildDepError "typed-process"))
        ];
        buildable = true;
      };
      exes = {
        "sydtest-mutation-driver" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."sydtest-mutation-driver" or (errorHandler.buildDepError "sydtest-mutation-driver"))
          ];
          buildable = true;
        };
      };
    };
  }