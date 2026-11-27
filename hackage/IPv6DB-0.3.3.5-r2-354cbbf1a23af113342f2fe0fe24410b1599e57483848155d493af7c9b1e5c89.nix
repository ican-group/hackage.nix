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
      specVersion = "1.10";
      identifier = { name = "IPv6DB"; version = "0.3.3.5"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2017-2026 - Michel Boucey";
      maintainer = "michel.boucey@gmail.com";
      author = "Michel Boucey";
      homepage = "https://github.com/MichelBoucey/IPv6DB";
      url = "";
      synopsis = "A RESTful microService for IPv6-related data";
      description = "IPv6DB is a RESTful microservice using Redis as backend\nto store lists of IPv6 addresses and attach to each of\nthem any valuable data in a schema-free valid JSON value.\nEach resource can be permanent or TTLed.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."IPv6Addr" or (errorHandler.buildDepError "IPv6Addr"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      exes = {
        "ipv6db" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."fast-logger" or (errorHandler.buildDepError "fast-logger"))
            (hsPkgs."IPv6Addr" or (errorHandler.buildDepError "IPv6Addr"))
            (hsPkgs."IPv6DB" or (errorHandler.buildDepError "IPv6DB"))
            (hsPkgs."hedis" or (errorHandler.buildDepError "hedis"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-logger" or (errorHandler.buildDepError "wai-logger"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ];
          buildable = true;
        };
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."IPv6DB" or (errorHandler.buildDepError "IPv6DB"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          ];
          buildable = true;
        };
      };
    };
  }