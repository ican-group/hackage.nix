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
    flags = { snappy = true; zstd = true; lz4 = true; brotli = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "wireform-parquet"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Ian Duncan";
      maintainer = "ian@iankduncan.com";
      author = "Ian Duncan";
      homepage = "https://github.com/iand675/wireform-";
      url = "";
      synopsis = "Apache Parquet metadata, column pages, and read/write";
      description = "Read and write Apache Parquet files, with column-page codecs,\nArrow column conversion, schema derivation, statistics, bloom filters,\nand predicate pushdown.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."wireform-core" or (errorHandler.buildDepError "wireform-core"))
          (hsPkgs."wireform-columnar-core" or (errorHandler.buildDepError "wireform-columnar-core"))
          (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
          (hsPkgs."wireform-derive" or (errorHandler.buildDepError "wireform-derive"))
          (hsPkgs."wireform-thrift" or (errorHandler.buildDepError "wireform-thrift"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
        ] ++ pkgs.lib.optional (flags.snappy) (hsPkgs."snappy" or (errorHandler.buildDepError "snappy"))) ++ pkgs.lib.optional (flags.zstd) (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"));
        libs = [ (pkgs."z" or (errorHandler.sysDepError "z")) ];
        pkgconfig = pkgs.lib.optionals (flags.brotli) [
          (pkgconfPkgs."libbrotlidec" or (errorHandler.pkgConfDepError "libbrotlidec"))
          (pkgconfPkgs."libbrotlienc" or (errorHandler.pkgConfDepError "libbrotlienc"))
        ];
        buildable = true;
      };
      exes = {
        "wireform-parquet-interop-probe" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "wireform-parquet-reverse-probe" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      tests = {
        "wireform-parquet-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."wireform-core" or (errorHandler.buildDepError "wireform-core"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."wireform-columnar-core" or (errorHandler.buildDepError "wireform-columnar-core"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."wireform-thrift" or (errorHandler.buildDepError "wireform-thrift"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
          ];
          buildable = true;
        };
        "wireform-parquet-derive-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."wireform-derive" or (errorHandler.buildDepError "wireform-derive"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."sydtest" or (errorHandler.buildDepError "sydtest"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "parquet-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-core" or (errorHandler.buildDepError "wireform-core"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
          ];
          buildable = true;
        };
        "parquet-selection-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "parquet-delta-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "parquet-dictionary-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "parquet-rle-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "parquet-byte-stream-split-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "parquet-alp-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "parquet-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-arrow" or (errorHandler.buildDepError "wireform-arrow"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "parquet-encryption-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-parquet" or (errorHandler.buildDepError "wireform-parquet"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }