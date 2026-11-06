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
    flags = { review-load = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "shomei-server"; version = "0.3.0.0"; };
      license = "MIT";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/shomei";
      url = "";
      synopsis = "Standalone Shōmei authentication service";
      description = "The standalone deployment of Shōmei: a warp executable that serves ShomeiAPI\nagainst PostgreSQL, the WAI middleware stack (structured logging, Prometheus\nmetrics, rate limiting, body limits), health and readiness probes, the\nenvironment-driven config loader, signing-key bootstrap and rotation, and\nbreach-password checking. Also ships shomei-admin, an operations CLI for\nuser administration and zero-downtime signing-key rotation. Other services\nverify its tokens by fetching its published JWKS.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."iproute" or (errorHandler.buildDepError "iproute"))
          (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
          (hsPkgs."mime-mail" or (errorHandler.buildDepError "mime-mail"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."servant-health" or (errorHandler.buildDepError "servant-health"))
          (hsPkgs."servant-server" or (errorHandler.buildDepError "servant-server"))
          (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
          (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
          (hsPkgs."shomei-migrations" or (errorHandler.buildDepError "shomei-migrations"))
          (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
          (hsPkgs."shomei-servant" or (errorHandler.buildDepError "shomei-servant"))
          (hsPkgs."shomei-webauthn" or (errorHandler.buildDepError "shomei-webauthn"))
          (hsPkgs."smtp-mail" or (errorHandler.buildDepError "smtp-mail"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
        ];
        buildable = true;
      };
      exes = {
        "shomei-server" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
          ];
          buildable = true;
        };
        "shomei-admin" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."contravariant-extras" or (errorHandler.buildDepError "contravariant-extras"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
            (hsPkgs."shomei-migrations" or (errorHandler.buildDepError "shomei-migrations"))
            (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
        "shomei-review-load" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."servant-health" or (errorHandler.buildDepError "servant-health"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
            (hsPkgs."shomei-migrations".components.sublibs.test-support or (errorHandler.buildDepError "shomei-migrations:test-support"))
            (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
            (hsPkgs."shomei-servant" or (errorHandler.buildDepError "shomei-servant"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ];
          buildable = if !flags.review-load then false else true;
        };
      };
      tests = {
        "shomei-server-config-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "shomei-admin-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."contravariant-extras" or (errorHandler.buildDepError "contravariant-extras"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
            (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
            (hsPkgs."shomei-migrations" or (errorHandler.buildDepError "shomei-migrations"))
            (hsPkgs."shomei-migrations".components.sublibs.test-support or (errorHandler.buildDepError "shomei-migrations:test-support"))
            (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
        "shomei-server-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base64" or (errorHandler.buildDepError "base64"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."servant-health" or (errorHandler.buildDepError "servant-health"))
            (hsPkgs."servant-health".components.sublibs.testkit or (errorHandler.buildDepError "servant-health:testkit"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
            (hsPkgs."shomei-migrations".components.sublibs.test-support or (errorHandler.buildDepError "shomei-migrations:test-support"))
            (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
            (hsPkgs."shomei-servant" or (errorHandler.buildDepError "shomei-servant"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ];
          buildable = true;
        };
        "shomei-health-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."servant-health" or (errorHandler.buildDepError "servant-health"))
            (hsPkgs."servant-health".components.sublibs.testkit or (errorHandler.buildDepError "servant-health:testkit"))
            (hsPkgs."shomei-core" or (errorHandler.buildDepError "shomei-core"))
            (hsPkgs."shomei-jwt" or (errorHandler.buildDepError "shomei-jwt"))
            (hsPkgs."shomei-migrations".components.sublibs.test-support or (errorHandler.buildDepError "shomei-migrations:test-support"))
            (hsPkgs."shomei-postgres" or (errorHandler.buildDepError "shomei-postgres"))
            (hsPkgs."shomei-server" or (errorHandler.buildDepError "shomei-server"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }