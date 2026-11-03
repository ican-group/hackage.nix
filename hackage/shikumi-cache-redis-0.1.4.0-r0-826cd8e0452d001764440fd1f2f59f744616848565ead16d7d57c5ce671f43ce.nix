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
      identifier = { name = "shikumi-cache-redis"; version = "0.1.4.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Redis-backed shikumi cache (EP-6)";
      description = "A Redis backend for shikumi's @Cache@ effect (EP-6), kept in a separate\npackage so the heavy @hedis@ client and a running Redis server are only\npulled in when actually used. Entries are stored under the string key\n@shikumi:cache:\\<hex\\>@ with a configurable TTL; the value is the UTF-8 JSON of\na @CachedResponse@ (the @Response@ round-trip comes from @shikumi-cache@'s\n@Shikumi.Cache.ResponseJSON@).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."hedis" or (errorHandler.buildDepError "hedis"))
          (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "shikumi-cache-redis-test" = {
          depends = [
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."hedis" or (errorHandler.buildDepError "hedis"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
            (hsPkgs."shikumi-cache-redis" or (errorHandler.buildDepError "shikumi-cache-redis"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }