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
      identifier = { name = "effectful-data-cache"; version = "0.2.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2026 drlkf";
      maintainer = "drlkf <drlkf@drlkf.net>";
      author = "drlkf";
      homepage = "https://github.com/haskell-github-trust/effectful-data-cache#readme";
      url = "";
      synopsis = "Data cache effect for the `effectful` system";
      description = "Please see the README on GitHub at <https://github.com/haskell-github-trust/effectful-data-cache#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."cache" or (errorHandler.buildDepError "cache"))
          (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
        ];
        buildable = true;
      };
      tests = {
        "effectful-data-cache-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cache" or (errorHandler.buildDepError "cache"))
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."effectful-data-cache" or (errorHandler.buildDepError "effectful-data-cache"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }