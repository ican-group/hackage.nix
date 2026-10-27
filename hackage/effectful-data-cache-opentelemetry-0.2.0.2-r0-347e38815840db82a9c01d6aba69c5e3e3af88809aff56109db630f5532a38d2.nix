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
        name = "effectful-data-cache-opentelemetry";
        version = "0.2.0.2";
      };
      license = "BSD-3-Clause";
      copyright = "2026 drlkf";
      maintainer = "drlkf <drlkf@drlkf.net>";
      author = "drlkf";
      homepage = "https://github.com/haskell-github-trust/effectful-data-cache#readme";
      url = "";
      synopsis = "OpenTelemetry instrumentation for effectful-data-cache";
      description = "Please see the README on GitHub at <https://github.com/haskell-github-trust/effectful-data-cache/tree/main/effectful-data-cache-opentelemetry#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."effectful-data-cache" or (errorHandler.buildDepError "effectful-data-cache"))
          (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "effectful-data-cache-opentelemetry-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."effectful-data-cache" or (errorHandler.buildDepError "effectful-data-cache"))
            (hsPkgs."effectful-data-cache-opentelemetry" or (errorHandler.buildDepError "effectful-data-cache-opentelemetry"))
            (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
            (hsPkgs."hs-opentelemetry-exporter-in-memory" or (errorHandler.buildDepError "hs-opentelemetry-exporter-in-memory"))
            (hsPkgs."hs-opentelemetry-sdk" or (errorHandler.buildDepError "hs-opentelemetry-sdk"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
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