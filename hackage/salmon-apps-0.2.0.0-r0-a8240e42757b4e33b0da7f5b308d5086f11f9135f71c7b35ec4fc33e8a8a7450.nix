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
      specVersion = "2.4";
      identifier = { name = "salmon-apps"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2022-2026 Lucas DiCioccio";
      maintainer = "lucas@dicioccio.fr";
      author = "Lucas DiCioccio";
      homepage = "https://lucasdicioccio.github.io/salmon/";
      url = "";
      synopsis = "A set of utilities built with Salmon at their core.";
      description = "Tools useful for operating systems, and which benefit from specialized implementations configured via external files: salmon-migrator, salmon-pgpair, salmon-fleet, salmon-tui and others.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."brick" or (errorHandler.buildDepError "brick"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."layoutz-hs" or (errorHandler.buildDepError "layoutz-hs"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."optparse-generic" or (errorHandler.buildDepError "optparse-generic"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."salmon-core" or (errorHandler.buildDepError "salmon-core"))
          (hsPkgs."salmon-ops" or (errorHandler.buildDepError "salmon-ops"))
          (hsPkgs."salmon-ops-recipes" or (errorHandler.buildDepError "salmon-ops-recipes"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."vty" or (errorHandler.buildDepError "vty"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
        ];
        buildable = true;
      };
      exes = {
        "salmon-toy-qemu-pg-ha" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-patroni-rootfs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-pgpair" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-migrator" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-init-locally" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-pg-backup" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-pgvector-demo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-fleet" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-gcp-toy" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-cloudrun" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-tui" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-report" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
        "salmon-docs-sync" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
          ];
          buildable = true;
        };
      };
      tests = {
        "salmon-apps-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."salmon-apps" or (errorHandler.buildDepError "salmon-apps"))
            (hsPkgs."salmon-core" or (errorHandler.buildDepError "salmon-core"))
            (hsPkgs."salmon-ops-recipes" or (errorHandler.buildDepError "salmon-ops-recipes"))
            (hsPkgs."salmon-ops" or (errorHandler.buildDepError "salmon-ops"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
      };
    };
  }