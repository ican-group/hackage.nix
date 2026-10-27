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
      identifier = { name = "heni-cli"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/heni";
      url = "";
      synopsis = "Command line interface to trustworthy deliberate mutation testing";
      description = "Validate manifests, run checked mutations, and render portable\nHeni evidence through the shared library runner.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "heni" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."heni" or (errorHandler.buildDepError "heni"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "heni-cli-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."heni" or (errorHandler.buildDepError "heni"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.heni.components.exes.heni-fixture or (pkgs.pkgsBuildBuild.heni-fixture or (errorHandler.buildToolDepError "heni:heni-fixture")))
            (hsPkgs.pkgsBuildBuild.heni-cli.components.exes.heni or (pkgs.pkgsBuildBuild.heni or (errorHandler.buildToolDepError "heni-cli:heni")))
          ];
          buildable = true;
        };
      };
    };
  }