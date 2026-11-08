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
    flags = { static = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "wasmedge-hs"; version = "0.18.1.0"; };
      license = "MIT";
      copyright = "2026 Tushar Adhatrao";
      maintainer = "tusharadhatrao@gmail.com";
      author = "Tushar Adhatrao";
      homepage = "https://github.com/tusharad/wasmedge-hs";
      url = "";
      synopsis = "Haskell FFI bindings for the WasmEdge 0.18 WebAssembly runtime";
      description = "Comprehensive, type-safe Haskell FFI bindings for the WasmEdge C API.\n\nFeatures:\n\n* Full coverage of the WasmEdge 0.18.x C API\n* Two-layer design: raw FFI layer + safe idiomatic public API\n* Phantom-typed ownership model — no double-frees or use-after-free\n* @bracket@-style resource management compatible with @MonadUnliftIO@\n* Support for WASI, host functions, async execution, AOT compilation,\n  plugins, Tag instances (exception handling), and lazy JIT mode\n* Property-tested with Hedgehog; unit-tested with HSpec";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."wide-word" or (errorHandler.buildDepError "wide-word"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
        ];
        libs = [ (pkgs."wasmedge" or (errorHandler.sysDepError "wasmedge")) ];
        buildable = true;
      };
      exes = {
        "wasmedge-hs-example-hello" = {
          depends = [
            (hsPkgs."wasmedge-hs" or (errorHandler.buildDepError "wasmedge-hs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
          buildable = true;
        };
        "wasmedge-hs-example-hostfunc" = {
          depends = [
            (hsPkgs."wasmedge-hs" or (errorHandler.buildDepError "wasmedge-hs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "wasmedge-hs-example-aot" = {
          depends = [
            (hsPkgs."wasmedge-hs" or (errorHandler.buildDepError "wasmedge-hs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ];
          buildable = true;
        };
        "wasmedge-hs-example-plugin" = {
          depends = [
            (hsPkgs."wasmedge-hs" or (errorHandler.buildDepError "wasmedge-hs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "wasmedge-hs-example-api-suite" = {
          depends = [
            (hsPkgs."wasmedge-hs" or (errorHandler.buildDepError "wasmedge-hs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          ];
          buildable = true;
        };
      };
      tests = {
        "wasmedge-hs-test" = {
          depends = [
            (hsPkgs."wasmedge-hs" or (errorHandler.buildDepError "wasmedge-hs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."hspec-hedgehog" or (errorHandler.buildDepError "hspec-hedgehog"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "wasmedge-hs-bench" = {
          depends = [
            (hsPkgs."wasmedge-hs" or (errorHandler.buildDepError "wasmedge-hs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }