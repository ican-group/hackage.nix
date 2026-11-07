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
      identifier = { name = "wireform-core"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Ian Duncan";
      maintainer = "ian@iankduncan.com";
      author = "Ian Duncan";
      homepage = "https://github.com/iand675/wireform-";
      url = "";
      synopsis = "Shared FFI primitives for wireform format packages";
      description = "Cross-format SWAR / SIMD-accelerated primitives used by every\n@wireform-*@ format package.\n.\nModules:\n.\n* @Wireform.FFI@ -- C FFI surface: packed-varint pre-scan + decode,\n  SWAR UTF-8 validation, SIMD NUL / byte / ASCII / whitespace\n  scanners, SIMD JSON escape scanner, SIMD Iceberg bounds compare,\n  Arrow IPC buffer validation, endianness helpers.\n* @Wireform.Encode.Direct@ -- shared direct-write encode buffer\n  used by the per-format encoders.\n* @Wireform.Hash@ -- SIMD-accelerated hashing helpers.\n.\nPulls in C sources (@cbits\\/fast_decode.c@, @cbits\\/fast_scan.c@,\n@cbits\\/wireform_hash_simd.c@) and the vendored @simde@ headers.\nContains no format-specific code.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        libs = pkgs.lib.optionals (system.isWindows) [
          (pkgs."kernel32" or (errorHandler.sysDepError "kernel32"))
          (pkgs."bcrypt" or (errorHandler.sysDepError "bcrypt"))
        ];
        buildable = true;
      };
      tests = {
        "wireform-core-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."wireform-core" or (errorHandler.buildDepError "wireform-core"))
            (hsPkgs."sydtest" or (errorHandler.buildDepError "sydtest"))
            (hsPkgs."sydtest-hedgehog" or (errorHandler.buildDepError "sydtest-hedgehog"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "parser-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."wireform-core" or (errorHandler.buildDepError "wireform-core"))
            (hsPkgs."flatparse" or (errorHandler.buildDepError "flatparse"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
          ];
          buildable = true;
        };
        "send-builder-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."wireform-core" or (errorHandler.buildDepError "wireform-core"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
          ];
          buildable = true;
        };
      };
    };
  }