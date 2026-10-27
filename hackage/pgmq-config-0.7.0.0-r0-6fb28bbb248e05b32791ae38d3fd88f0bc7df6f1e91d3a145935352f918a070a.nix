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
    flags = { effectful = true; };
    package = {
      specVersion = "3.4";
      identifier = { name = "pgmq-config"; version = "0.7.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Nadeem Bitar";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/pgmq-hs";
      url = "";
      synopsis = "Declarative queue configuration for PGMQ (PostgreSQL Message Queue)";
      description = "A declarative DSL for configuring pgmq queues. Define your queue\ntopology as Haskell values and call a single function at startup\nto create whatever is missing: standard, unlogged, and partitioned\nqueues, insert notifications, FIFO indexes, and topic bindings.\n.\nReconciliation is additive and convergent. It never drops, converts,\nor disables anything, and leaves queues that are absent from the\nconfig untouched; a second run against an unchanged config issues no\nmutations at all. The single exception is a declared notification\nthrottle interval that differs from the stored one, which is updated\nin place. A queue whose observed type contradicts the declared one is\nreported as drift rather than repaired, since converting a queue's\ntype would mean destroying its messages.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."pgmq-core" or (errorHandler.buildDepError "pgmq-core"))
          (hsPkgs."pgmq-hasql" or (errorHandler.buildDepError "pgmq-hasql"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optionals (flags.effectful) [
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."pgmq-effectful" or (errorHandler.buildDepError "pgmq-effectful"))
        ];
        buildable = true;
      };
      tests = {
        "pgmq-config-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-pool" or (errorHandler.buildDepError "hasql-pool"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."pgmq-config" or (errorHandler.buildDepError "pgmq-config"))
            (hsPkgs."pgmq-core" or (errorHandler.buildDepError "pgmq-core"))
            (hsPkgs."pgmq-hasql" or (errorHandler.buildDepError "pgmq-hasql"))
            (hsPkgs."pgmq-migration" or (errorHandler.buildDepError "pgmq-migration"))
            (hsPkgs."postgresql-libpq" or (errorHandler.buildDepError "postgresql-libpq"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ] ++ pkgs.lib.optionals (flags.effectful) [
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."pgmq-effectful" or (errorHandler.buildDepError "pgmq-effectful"))
          ];
          buildable = true;
        };
      };
    };
  }