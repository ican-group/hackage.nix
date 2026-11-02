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
      specVersion = "3.0";
      identifier = { name = "network-transport-quic"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "Laurent P. René de Cotret";
      maintainer = "The Distributed Haskell team";
      author = "Laurent P. René de Cotret";
      homepage = "https://haskell-distributed.github.io";
      url = "";
      synopsis = "Networking layer for Cloud Haskell based on QUIC";
      description = "Networking layer for Cloud Haskell based on QUIC.\n\nThe QUIC protocol has several advantages over TCP, including built-in encryption via TLS 1.3,\nsupport for connection migration (e.g. when transitioning from WIFI to 5G), and stream multiplexing which\neliminates head-of-line blocking.\n\nIn dense network topologies, using [\"Network.Transport.QUIC\"] may improve performance by a factor of 2 over\nother transport implementations.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."microlens-platform" or (errorHandler.buildDepError "microlens-platform"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."network-transport" or (errorHandler.buildDepError "network-transport"))
          (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."tls-session-manager" or (errorHandler.buildDepError "tls-session-manager"))
        ];
        buildable = true;
      };
      tests = {
        "network-transport-quic-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."network-transport" or (errorHandler.buildDepError "network-transport"))
            (hsPkgs."network-transport-quic" or (errorHandler.buildDepError "network-transport-quic"))
            (hsPkgs."network-transport-tests" or (errorHandler.buildDepError "network-transport-tests"))
            (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-flaky" or (errorHandler.buildDepError "tasty-flaky"))
            (hsPkgs."tasty-hedgehog" or (errorHandler.buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "network-transport-quic-bench" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."network-transport" or (errorHandler.buildDepError "network-transport"))
            (hsPkgs."network-transport-tcp" or (errorHandler.buildDepError "network-transport-tcp"))
            (hsPkgs."network-transport-quic" or (errorHandler.buildDepError "network-transport-quic"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = true;
        };
      };
    };
  }