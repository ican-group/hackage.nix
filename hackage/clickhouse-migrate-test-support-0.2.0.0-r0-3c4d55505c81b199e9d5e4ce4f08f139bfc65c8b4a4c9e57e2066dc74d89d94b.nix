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
    flags = { integration = false; };
    package = {
      specVersion = "3.12";
      identifier = {
        name = "clickhouse-migrate-test-support";
        version = "0.2.0.0";
      };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "shinzui@users.noreply.github.com";
      author = "shinzui";
      homepage = "";
      url = "";
      synopsis = "Isolated server fixtures for ClickHouse migration tests";
      description = "Isolated server fixtures for ClickHouse migration tests.\nValidated public APIs with explicit application-owned configuration and scope.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."clickhouse-migrate" or (errorHandler.buildDepError "clickhouse-migrate"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filelock" or (errorHandler.buildDepError "filelock"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "clickhouse-migrate-integration" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."clickhouse-migrate" or (errorHandler.buildDepError "clickhouse-migrate"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filelock" or (errorHandler.buildDepError "filelock"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."clickhouse-migrate-cli" or (errorHandler.buildDepError "clickhouse-migrate-cli"))
            (hsPkgs."clickhouse-migrate-embed" or (errorHandler.buildDepError "clickhouse-migrate-embed"))
            (hsPkgs."clickhouse-migrate-test-support" or (errorHandler.buildDepError "clickhouse-migrate-test-support"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
          buildable = if !flags.integration then false else true;
        };
      };
    };
  }