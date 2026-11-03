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
      identifier = { name = "shikumi-cache-postgres"; version = "0.1.4.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Postgres-backed shikumi cache (EP-6)";
      description = "A PostgreSQL backend for shikumi's @Cache@ effect (EP-6), in a separate\npackage so the @hasql@ client (and libpq) is only pulled in when used. Entries\nlive in a @shikumi_cache(key text primary key, value jsonb, stored_at\ntimestamptz)@ table, upserted on conflict; the value is the JSON of a\n@CachedResponse@ (the @Response@ round-trip comes from @shikumi-cache@'s\n@Shikumi.Cache.ResponseJSON@). The test uses @ephemeral-pg@ to spin up a\nthrowaway server, so it needs no external database.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "shikumi-cache-postgres-test" = {
          depends = [
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
            (hsPkgs."shikumi-cache-postgres" or (errorHandler.buildDepError "shikumi-cache-postgres"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }