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
    flags = { zstd = false; lz4 = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "wireform-arrow"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Ian Duncan";
      maintainer = "ian@iankduncan.com";
      author = "Ian Duncan";
      homepage = "";
      url = "";
      synopsis = "Apache Arrow IPC schema framing and record batch materialization";
      description = "Arrow column arrays and IPC file/stream codecs, with schema and record\nderivation and optional LZ4 and Zstandard buffer compression.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."wireform-core" or (errorHandler.buildDepError "wireform-core"))
          (hsPkgs."wireform-columnar-core" or (errorHandler.buildDepError "wireform-columnar-core"))
          (hsPkgs."wireform-derive" or (errorHandler.buildDepError "wireform-derive"))
          (hsPkgs."wireform-flatbuffers" or (errorHandler.buildDepError "wireform-flatbuffers"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
        ] ++ pkgs.lib.optional (flags.zstd) (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))) ++ pkgs.lib.optional (flags.lz4) (hsPkgs."lz4-hs" or (errorHandler.buildDepError "lz4-hs"));
        buildable = true;
      };
      tests = {
        "wireform-arrow-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."wireform-columnar-core" or (errorHandler.buildDepError "wireform-columnar-core"))
            (hsPkgs."wireform-flatbuffers" or (errorHandler.buildDepError "wireform-flatbuffers"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          ];
          buildable = true;
        };
        "wireform-arrow-derive-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."wireform-derive" or (errorHandler.buildDepError "wireform-derive"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."sydtest" or (errorHandler.buildDepError "sydtest"))
          ];
          buildable = true;
        };
        "wireform-arrow-pyarrow-interop" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "wireform-arrow-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
          ];
          buildable = true;
        };
      };
    };
  }