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
      identifier = { name = "acme-not-a-joke-warp"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Lucas DiCioccio 2023-2026";
      maintainer = "lucas@dicioccio.fr";
      author = "Lucas DiCioccio";
      homepage = "https://lucasdicioccio.github.io/acme-not-a-joke/";
      url = "";
      synopsis = "automatic HTTPS for warp: obtains, stores, renews and serves ACME certificates";
      description = "runs a wai application over HTTPS with certificates obtained from an ACME provider such as Let's Encrypt (rfc-8555, HTTP-01 challenges, or TLS-ALPN-01 challenges of rfc-8737 which need no port 80), in the spirit of Caddy. A certificate manager obtains the certificates when the server starts, stores them on disk, renews them before they expire and hands them to the running warp-tls server without a restart. Built on the acme-not-a-joke and acme-not-a-joke-wai libraries.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
          (hsPkgs."acme-not-a-joke-wai" or (errorHandler.buildDepError "acme-not-a-joke-wai"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."time-hourglass" or (errorHandler.buildDepError "time-hourglass"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
        ];
        buildable = true;
      };
      exes = {
        "acme-not-a-joke-warp-example" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."acme-not-a-joke-warp" or (errorHandler.buildDepError "acme-not-a-joke-warp"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          ];
          buildable = if !flags.example then false else true;
        };
      };
      tests = {
        "certificate-manager" = {
          depends = [
            (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
            (hsPkgs."acme-not-a-joke-wai" or (errorHandler.buildDepError "acme-not-a-joke-wai"))
            (hsPkgs."acme-not-a-joke-warp" or (errorHandler.buildDepError "acme-not-a-joke-warp"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."crypton-asn1-types" or (errorHandler.buildDepError "crypton-asn1-types"))
            (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."time-hourglass" or (errorHandler.buildDepError "time-hourglass"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ];
          buildable = true;
        };
      };
    };
  }