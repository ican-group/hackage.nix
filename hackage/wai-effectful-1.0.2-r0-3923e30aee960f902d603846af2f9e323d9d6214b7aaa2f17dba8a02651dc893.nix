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
      identifier = { name = "wai-effectful"; version = "1.0.2"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "IDA";
      author = "IDA";
      homepage = "https://digital-autonomy.institute";
      url = "";
      synopsis = "Effectful bindings for the wai library";
      description = "Adaptation of the @<https://hackage.haskell.org/package/wai wai>@ library for the @<https://hackage.haskell.org/package/effectful effectful>@ ecosystem.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vault" or (errorHandler.buildDepError "vault"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
        ];
        buildable = true;
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."hspec-effectful" or (errorHandler.buildDepError "hspec-effectful"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-effectful" or (errorHandler.buildDepError "wai-effectful"))
          ];
          buildable = true;
        };
      };
    };
  }