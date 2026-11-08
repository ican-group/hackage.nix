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
      identifier = { name = "specup"; version = "0.2.0.7"; };
      license = "GPL-2.0-only";
      copyright = "(c) 2024 Daniel Rolls";
      maintainer = "daniel.rolls.27@googlemail.com";
      author = "Daniel Rolls";
      homepage = "";
      url = "";
      synopsis = "Manage the application of templates to custom yaml";
      description = "Please see the README on GitHub at <https://github.com/danielrolls/specup>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          (hsPkgs."stache" or (errorHandler.buildDepError "stache"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
        ];
        buildable = true;
      };
      exes = {
        "specup" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."specup" or (errorHandler.buildDepError "specup"))
          ];
          buildable = true;
        };
      };
      tests = {
        "specup-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."specup" or (errorHandler.buildDepError "specup"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.specup.components.exes.specup or (pkgs.pkgsBuildBuild.specup or (errorHandler.buildToolDepError "specup:specup")))
          ];
          buildable = true;
        };
      };
    };
  }