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
      identifier = { name = "glue-prometheus"; version = "0.8.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "github@futurenotfound.com";
      author = "Sean Parsons";
      homepage = "";
      url = "";
      synopsis = "Make better services and clients.";
      description = "Glue library that records Prometheus metrics for services and glue's combinators through prometheus-client.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."glue-common" or (errorHandler.buildDepError "glue-common"))
          (hsPkgs."glue-core" or (errorHandler.buildDepError "glue-core"))
          (hsPkgs."prometheus-client" or (errorHandler.buildDepError "prometheus-client"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
        ];
        buildable = true;
      };
      tests = {
        "glue-prometheus-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."glue-common" or (errorHandler.buildDepError "glue-common"))
            (hsPkgs."glue-core" or (errorHandler.buildDepError "glue-core"))
            (hsPkgs."glue-prometheus" or (errorHandler.buildDepError "glue-prometheus"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."prometheus-client" or (errorHandler.buildDepError "prometheus-client"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }