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
      identifier = { name = "http-barf"; version = "0.1.2.0"; };
      license = "AGPL-3.0-or-later";
      copyright = "";
      maintainer = "contact@mangoiv.com";
      author = "mangoiv";
      homepage = "https://git.mangoiv.com/mangoiv/http-barf";
      url = "";
      synopsis = "a library to make http requests without worrying much ";
      description = "a dead simple library to make http requests. It provides helper functions to use different http methods, it supports \nboth insecure and secure connections without having to deal with managers and the requests can be trivially modified using a monoidal\ncombinator library";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "http-barf-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."http-barf" or (errorHandler.buildDepError "http-barf"))
          ];
          buildable = true;
        };
      };
    };
  }