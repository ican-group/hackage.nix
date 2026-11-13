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
      specVersion = "2.2";
      identifier = { name = "ghc-trace-events"; version = "0.1.2.10"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2018-2025 Mitsutoshi Aoe";
      maintainer = "Mitsutoshi Aoe <me@maoe.name>";
      author = "Mitsutoshi Aoe";
      homepage = "https://github.com/maoe/ghc-trace-events";
      url = "";
      synopsis = "Faster traceEvent and traceMarker, and binary object logging for\neventlog";
      description = "ghc-trace-events provides faster traceEvent and traceMarker as well\nas arbitrary binary object logging for the eventlog framework. Unlike the\n<http://hackage.haskell.org/package/base/docs/Debug-Trace.html#g:2 eventlog tracing functions in base>,\nall the tracing functions in this library don't evaluate the input if user\nevent logging (the\n<https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/runtime_control.html#rts-flag--l%20⟨flags⟩ -lu>\nflag) is disabled, which can give a significant boost in performance. Take a\nlook at the benchmark suite for the details.\n\nThis library provies the following modules:\n\n[\"Debug.Trace.String\"] Drop-in replacement for the event tracing functions in\n\"Debug.Trace\".\n[\"Debug.Trace.ByteString\"] UTF-8 encoded 'ByteString' variant\nof the event tracing functions in \"Debug.Trace\". It's faster than the 'String'\nvariant.\n[\"Debug.Trace.Text\"] 'Text' variant of the event tracing functions\nin \"Debug.Trace\". It's faster than the 'String' variant.\n[\"Debug.Trace.Binary\"] Arbitary binary object logging available for GHC 8.8 or\nlater. Unlike the other tracing functions 'Debug.Trace.Binary.traceBinaryEvent'\ntakes an arbitrary 'ByteString' object as opposed to a UTF-8\nencoded string.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      benchmarks = {
        "bench-trace-enabled" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."ghc-trace-events" or (errorHandler.buildDepError "ghc-trace-events"))
          ];
          buildable = true;
        };
        "bench-trace-disabled" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."ghc-trace-events" or (errorHandler.buildDepError "ghc-trace-events"))
          ];
          buildable = true;
        };
      };
    };
  }