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
      identifier = {
        name = "effectful-config-file-secretspec";
        version = "0.1.1.1";
      };
      license = "BSD-3-Clause";
      copyright = "2026 drlkf";
      maintainer = "drlkf@drlkf.net";
      author = "drlkf";
      homepage = "";
      url = "";
      synopsis = "SecretSpec backend for effectful-config-file";
      description = "SecretSpec-backed Secrets effect handler for effectful-config-file";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."effectful-config-file" or (errorHandler.buildDepError "effectful-config-file"))
          (hsPkgs."secretspec" or (errorHandler.buildDepError "secretspec"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
        ];
        buildable = true;
      };
      tests = {
        "effectful-config-file-secretspec-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."effectful-config-file" or (errorHandler.buildDepError "effectful-config-file"))
            (hsPkgs."effectful-config-file-secretspec" or (errorHandler.buildDepError "effectful-config-file-secretspec"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."secretspec" or (errorHandler.buildDepError "secretspec"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }