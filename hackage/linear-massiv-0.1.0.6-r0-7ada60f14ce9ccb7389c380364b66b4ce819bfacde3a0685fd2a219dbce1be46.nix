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
    flags = { simd = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "linear-massiv"; version = "0.1.0.6"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "Nadia Yvette Chambers <nadia.yvette.chambers@ik.me>";
      author = "Nadia Yvette Chambers";
      homepage = "";
      url = "";
      synopsis = "Pure Haskell numerical linear algebra implementing Golub & Van Loan";
      description = "Pure Haskell numerical linear algebra implementing algorithms from\nGolub & Van Loan's /Matrix Computations/ (4th ed.), with no FFI and no C\ndependencies.\n\nProvides type-safe matrix and vector operations backed by\n<https://hackage.haskell.org/package/massiv massiv> arrays, with\ncompile-time dimension checking via GHC type-level naturals.\nImplements BLAS Level 1–3 operations, panel LU, Cholesky, and QR\nfactorisations, blocked WY Householder transformations, banded linear\nsolvers, symmetric eigenvalue decomposition, and singular value\ndecomposition (SVD).\n\nExecution is portable across all architectures and GHC versions (9.6+)\nusing efficient unboxed scalar kernels by default. On x86_64 systems with\nAVX2 and FMA support, optional SIMD acceleration can be enabled via the\n@simd@ cabal flag when compiling with GHC's LLVM backend.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."massiv" or (errorHandler.buildDepError "massiv"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
        ];
        buildable = true;
      };
      tests = {
        "linear-massiv-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."linear-massiv" or (errorHandler.buildDepError "linear-massiv"))
            (hsPkgs."massiv" or (errorHandler.buildDepError "massiv"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "linear-massiv-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."linear-massiv" or (errorHandler.buildDepError "linear-massiv"))
            (hsPkgs."massiv" or (errorHandler.buildDepError "massiv"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          ];
          buildable = true;
        };
        "linear-massiv-comparison" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."linear-massiv" or (errorHandler.buildDepError "linear-massiv"))
            (hsPkgs."massiv" or (errorHandler.buildDepError "massiv"))
            (hsPkgs."hmatrix" or (errorHandler.buildDepError "hmatrix"))
            (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }