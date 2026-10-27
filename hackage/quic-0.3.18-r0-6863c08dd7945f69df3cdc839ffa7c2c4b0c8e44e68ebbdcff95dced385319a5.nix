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
    flags = { devel = false; qlog = false; };
    package = {
      specVersion = "2.0";
      identifier = { name = "quic"; version = "0.3.18"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "kazu@iij.ad.jp";
      author = "Kazu Yamamoto";
      homepage = "";
      url = "";
      synopsis = "QUIC";
      description = "Library for QUIC: A UDP-Based Multiplexed and Secure Transport";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypto-token" or (errorHandler.buildDepError "crypto-token"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
          (hsPkgs."crypton-x509-store" or (errorHandler.buildDepError "crypton-x509-store"))
          (hsPkgs."crypton-x509-system" or (errorHandler.buildDepError "crypton-x509-system"))
          (hsPkgs."crypton-x509-validation" or (errorHandler.buildDepError "crypton-x509-validation"))
          (hsPkgs."fast-logger" or (errorHandler.buildDepError "fast-logger"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."iproute" or (errorHandler.buildDepError "iproute"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."network-byte-order" or (errorHandler.buildDepError "network-byte-order"))
          (hsPkgs."network-control" or (errorHandler.buildDepError "network-control"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."serialise" or (errorHandler.buildDepError "serialise"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."time-manager" or (errorHandler.buildDepError "time-manager"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."unix-time" or (errorHandler.buildDepError "unix-time"))
        ];
        buildable = true;
      };
      exes = {
        "quic-server" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http2" or (errorHandler.buildDepError "http2"))
            (hsPkgs."network-byte-order" or (errorHandler.buildDepError "network-byte-order"))
            (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."tls-session-manager" or (errorHandler.buildDepError "tls-session-manager"))
          ];
          buildable = if flags.devel then true else false;
        };
        "quic-client" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http2" or (errorHandler.buildDepError "http2"))
            (hsPkgs."network-byte-order" or (errorHandler.buildDepError "network-byte-order"))
            (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."unix-time" or (errorHandler.buildDepError "unix-time"))
          ];
          buildable = if flags.devel then true else false;
        };
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."crypto-token" or (errorHandler.buildDepError "crypto-token"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."fast-logger" or (errorHandler.buildDepError "fast-logger"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."unix-time" or (errorHandler.buildDepError "unix-time"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }