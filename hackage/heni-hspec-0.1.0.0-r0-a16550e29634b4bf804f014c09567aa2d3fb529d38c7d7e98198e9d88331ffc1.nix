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
      specVersion = "3.4";
      identifier = { name = "heni-hspec"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/heni";
      url = "";
      synopsis = "Attempt-bound Hspec evidence for Heni";
      description = "Optional framework reporter for trustworthy named mutation evidence.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."heni" or (errorHandler.buildDepError "heni"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          (hsPkgs."hspec-api" or (errorHandler.buildDepError "hspec-api"))
          (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
        ];
        buildable = true;
      };
      exes = {
        "heni-hspec-fixture" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."heni" or (errorHandler.buildDepError "heni"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."heni-hspec" or (errorHandler.buildDepError "heni-hspec"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-api" or (errorHandler.buildDepError "hspec-api"))
            (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
          ];
          buildable = true;
        };
      };
      tests = {
        "heni-hspec-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."heni" or (errorHandler.buildDepError "heni"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."heni-hspec" or (errorHandler.buildDepError "heni-hspec"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.heni-cli.components.exes.heni or (pkgs.pkgsBuildBuild.heni or (errorHandler.buildToolDepError "heni-cli:heni")))
            (hsPkgs.pkgsBuildBuild.heni-hspec.components.exes.heni-hspec-fixture or (pkgs.pkgsBuildBuild.heni-hspec-fixture or (errorHandler.buildToolDepError "heni-hspec:heni-hspec-fixture")))
          ];
          buildable = true;
        };
      };
    };
  }