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
    flags = { devel = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "http2-tls"; version = "0.5.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
      author = "Kazu Yamamoto <kazu@iij.ad.jp>";
      homepage = "https://github.com/kazu-yamamoto/http2-tls";
      url = "";
      synopsis = "Library for HTTP/2 over TLS";
      description = "Using the HTTP/2 library over TLS";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."crypton-x509-store" or (errorHandler.buildDepError "crypton-x509-store"))
          (hsPkgs."crypton-x509-system" or (errorHandler.buildDepError "crypton-x509-system"))
          (hsPkgs."crypton-x509-validation" or (errorHandler.buildDepError "crypton-x509-validation"))
          (hsPkgs."http2" or (errorHandler.buildDepError "http2"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."network-control" or (errorHandler.buildDepError "network-control"))
          (hsPkgs."network-run" or (errorHandler.buildDepError "network-run"))
          (hsPkgs."recv" or (errorHandler.buildDepError "recv"))
          (hsPkgs."time-manager" or (errorHandler.buildDepError "time-manager"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
        ];
        buildable = true;
      };
      exes = {
        "h2-client" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."http-semantics" or (errorHandler.buildDepError "http-semantics"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."http2" or (errorHandler.buildDepError "http2"))
            (hsPkgs."http2-tls" or (errorHandler.buildDepError "http2-tls"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."unix-time" or (errorHandler.buildDepError "unix-time"))
          ];
          buildable = if flags.devel then true else false;
        };
        "h2-server" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."http2" or (errorHandler.buildDepError "http2"))
            (hsPkgs."http2-tls" or (errorHandler.buildDepError "http2-tls"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."tls-session-manager" or (errorHandler.buildDepError "tls-session-manager"))
          ];
          buildable = if flags.devel then true else false;
        };
      };
    };
  }