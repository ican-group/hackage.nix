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
      identifier = { name = "heni-tasty"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/heni";
      url = "";
      synopsis = "Attempt-bound Tasty evidence for Heni";
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
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
        ];
        buildable = true;
      };
      exes = {
        "heni-tasty-fixture" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."heni" or (errorHandler.buildDepError "heni"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."heni-tasty" or (errorHandler.buildDepError "heni-tasty"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
      tests = {
        "heni-tasty-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."heni" or (errorHandler.buildDepError "heni"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."heni-tasty" or (errorHandler.buildDepError "heni-tasty"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.heni-cli.components.exes.heni or (pkgs.pkgsBuildBuild.heni or (errorHandler.buildToolDepError "heni-cli:heni")))
            (hsPkgs.pkgsBuildBuild.heni-tasty.components.exes.heni-tasty-fixture or (pkgs.pkgsBuildBuild.heni-tasty-fixture or (errorHandler.buildToolDepError "heni-tasty:heni-tasty-fixture")))
          ];
          buildable = true;
        };
      };
    };
  }