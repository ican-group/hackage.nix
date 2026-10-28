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
        name = "effectful-data-cache-memcache";
        version = "0.2.2.0";
      };
      license = "BSD-3-Clause";
      copyright = "2026 drlkf";
      maintainer = "drlkf <drlkf@drlkf.net>";
      author = "drlkf";
      homepage = "https://github.com/haskell-github-trust/effectful-data-cache#readme";
      url = "";
      synopsis = "memcached backend for effectful-data-cache";
      description = "Please see the README on GitHub at <https://github.com/haskell-github-trust/effectful-data-cache/tree/main/effectful-data-cache-memcache#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."effectful-data-cache" or (errorHandler.buildDepError "effectful-data-cache"))
          (hsPkgs."memcache" or (errorHandler.buildDepError "memcache"))
        ];
        buildable = true;
      };
      tests = {
        "effectful-data-cache-memcache-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."effectful-data-cache" or (errorHandler.buildDepError "effectful-data-cache"))
            (hsPkgs."effectful-data-cache-memcache" or (errorHandler.buildDepError "effectful-data-cache-memcache"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."memcache" or (errorHandler.buildDepError "memcache"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }