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
    flags = { lzo-reference-bench = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "wireform-columnar-core"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Ian Duncan";
      maintainer = "ian@iankduncan.com";
      author = "Ian Duncan";
      homepage = "https://github.com/iand675/wireform-";
      url = "";
      synopsis = "SIMD-accelerated columnar primitives (bit-unpacking, etc.)";
      description = "Format-agnostic columnar primitives shared by the wireform Arrow,\nParquet, ORC, and Iceberg packages: a pull-based iterator surface\n('Columnar.Stream'), a pushdown predicate vocabulary\n('Columnar.Predicate'), an mmap-aware file loader ('Columnar.IO'),\nLZ4 and raw LZO1X codecs ('Columnar.LZ4', 'Columnar.LZO'), and SIMD-accelerated\nbit-unpacking / popcount kernels ('Columnar.SIMD').";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."mmap" or (errorHandler.buildDepError "mmap"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
        ];
        libs = [ (pkgs."lz4" or (errorHandler.sysDepError "lz4")) ];
        buildable = true;
      };
      tests = {
        "wireform-columnar-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-columnar-core" or (errorHandler.buildDepError "wireform-columnar-core"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."sydtest" or (errorHandler.buildDepError "sydtest"))
            (hsPkgs."sydtest-hedgehog" or (errorHandler.buildDepError "sydtest-hedgehog"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "columnar-lzo-throughput" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."wireform-columnar-core" or (errorHandler.buildDepError "wireform-columnar-core"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
          ];
          libs = pkgs.lib.optional (flags.lzo-reference-bench) (pkgs."lzo2" or (errorHandler.sysDepError "lzo2"));
          buildable = true;
        };
      };
    };
  }