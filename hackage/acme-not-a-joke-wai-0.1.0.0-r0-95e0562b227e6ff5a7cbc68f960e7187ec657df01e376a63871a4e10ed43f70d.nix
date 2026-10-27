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
    flags = { example = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "acme-not-a-joke-wai"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Lucas DiCioccio 2023-2026";
      maintainer = "lucas@dicioccio.fr";
      author = "Lucas DiCioccio";
      homepage = "https://lucasdicioccio.github.io/acme-not-a-joke/";
      url = "";
      synopsis = "ACME http-01 and tls-alpn-01 challenges and live certificates for wai/warp";
      description = "a wai middleware and a step handler to validate HTTP-01 challenges (rfc-8555) with the acme-not-a-joke library, so that a wai/warp application can get its own TLS certificates, and TLS settings answering TLS-ALPN-01 challenges (rfc-8737) from a running warp-tls server, without port 80. Also has a certificate store read by warp-tls at each handshake, so that new certificates are served without restarting.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
        ];
        buildable = true;
      };
      exes = {
        "acme-not-a-joke-wai-example" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."acme-not-a-joke-wai" or (errorHandler.buildDepError "acme-not-a-joke-wai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
          ];
          buildable = if !flags.example then false else true;
        };
      };
      tests = {
        "http01" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."acme-not-a-joke-wai" or (errorHandler.buildDepError "acme-not-a-joke-wai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          ];
          buildable = true;
        };
        "warp-tls" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."acme-not-a-joke-wai" or (errorHandler.buildDepError "acme-not-a-joke-wai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."crypton-asn1-types" or (errorHandler.buildDepError "crypton-asn1-types"))
            (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."time-hourglass" or (errorHandler.buildDepError "time-hourglass"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
          ];
          buildable = true;
        };
        "tls-alpn-01" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."acme-not-a-joke-wai" or (errorHandler.buildDepError "acme-not-a-joke-wai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."crypton-asn1-encoding" or (errorHandler.buildDepError "crypton-asn1-encoding"))
            (hsPkgs."crypton-asn1-types" or (errorHandler.buildDepError "crypton-asn1-types"))
            (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
            (hsPkgs."crypton-x509-validation" or (errorHandler.buildDepError "crypton-x509-validation"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."time-hourglass" or (errorHandler.buildDepError "time-hourglass"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
          ];
          buildable = true;
        };
      };
    };
  }