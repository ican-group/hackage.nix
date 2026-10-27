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
      identifier = { name = "acme-not-a-joke"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Lucas DiCioccio 2023-2026";
      maintainer = "lucas@dicioccio.fr";
      author = "Lucas DiCioccio";
      homepage = "https://lucasdicioccio.github.io/acme-not-a-joke/";
      url = "";
      synopsis = "implements ACME clients (rfc-8555)";
      description = "a library to get TLS certificates by communicating with an ACME provider such as Let's Encrypt (rfc-8555). It creates accounts and orders, validates them with HTTP-01, DNS-01 or TLS-ALPN-01 (rfc-8737) challenges, downloads certificates, and handles account key rollover, account deactivation and certificate revocation. It also generates and reads the keys, CSRs and certificates involved. Hence: no, the acme prefix is not a marker for a joke. See acme-not-a-joke-wai and acme-not-a-joke-warp to serve challenges and certificates from a wai/warp application.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."time-hourglass" or (errorHandler.buildDepError "time-hourglass"))
          (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."crypton-asn1-encoding" or (errorHandler.buildDepError "crypton-asn1-encoding"))
          (hsPkgs."crypton-asn1-types" or (errorHandler.buildDepError "crypton-asn1-types"))
          (hsPkgs."crypton-pem" or (errorHandler.buildDepError "crypton-pem"))
          (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
          (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
      tests = {
        "pki-formats" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
            (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "key-change" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }