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
      identifier = { name = "pqi-native"; version = "1.0.1.15"; };
      license = "MIT";
      copyright = "(c) 2026, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/pqi-native";
      url = "";
      synopsis = "Native (pure-Haskell) adapter for pqi";
      description = "A @pqi@ adapter that speaks the PostgreSQL frontend\\/backend wire\nprotocol directly, with no dependency on the C @libpq@ library. The transport\nlayer (framing, message serialization\\/deserialization, socket I\\/O) is\nisolated in an internal @transport@ sub-library built on @ptr-poker@ and\n@ptr-peeker@; the public library is an abstraction over it that builds the\n@pqi@ @Adapter@.\n\n__Status: Alpha.__ Verified exactly against @postgresql-libpq@ via a\ndifferential conformance suite, but not yet proven in production. It\nimplements the same @pqi@ interface as\n[@pqi-ffi@](https://hackage.haskell.org/package/pqi-ffi), the stable\nC-backed adapter, so the two are fully interchangeable - swapping\nbetween them is a one-line @Adapter@ change.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
          (hsPkgs."pqi-native".components.sublibs.transport or (errorHandler.buildDepError "pqi-native:transport"))
          (hsPkgs."ptr-peeker" or (errorHandler.buildDepError "ptr-peeker"))
          (hsPkgs."ptr-poker" or (errorHandler.buildDepError "ptr-poker"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"))) ++ pkgs.lib.optional (system.isWindows) (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"));
        buildable = true;
      };
      sublibs = {
        "comms" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ptr-peeker" or (errorHandler.buildDepError "ptr-peeker"))
            (hsPkgs."ptr-poker" or (errorHandler.buildDepError "ptr-poker"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
        "transport" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."pqi-native".components.sublibs.comms or (errorHandler.buildDepError "pqi-native:comms"))
            (hsPkgs."ptr-peeker" or (errorHandler.buildDepError "ptr-peeker"))
            (hsPkgs."ptr-poker" or (errorHandler.buildDepError "ptr-poker"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
      };
      tests = {
        "native-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."pqi-conformance" or (errorHandler.buildDepError "pqi-conformance"))
            (hsPkgs."pqi-native" or (errorHandler.buildDepError "pqi-native"))
          ];
          buildable = true;
        };
      };
    };
  }