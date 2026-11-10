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
      identifier = { name = "hasktorch-CudaHashMap"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "skata@cs.miyazaki-u.ac.jp";
      author = "Susumu Katayama";
      homepage = "";
      url = "";
      synopsis = "HaskTorch interface to the GPU-parallel hashmap in cuCollections";
      description = "";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.pkgsBuildBuild.base or (pkgs.pkgsBuildBuild.base or (errorHandler.setupDepError "base")))
        (hsPkgs.pkgsBuildBuild.Cabal or (pkgs.pkgsBuildBuild.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.pkgsBuildBuild.directory or (pkgs.pkgsBuildBuild.directory or (errorHandler.setupDepError "directory")))
        (hsPkgs.pkgsBuildBuild.process or (pkgs.pkgsBuildBuild.process or (errorHandler.setupDepError "process")))
      ];
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hasktorch" or (errorHandler.buildDepError "hasktorch"))
          (hsPkgs."libtorch-ffi" or (errorHandler.buildDepError "libtorch-ffi"))
        ];
        libs = [
          (pkgs."cuco_wrapper" or (errorHandler.sysDepError "cuco_wrapper"))
          (pkgs."cuda" or (errorHandler.sysDepError "cuda"))
          (pkgs."cudart" or (errorHandler.sysDepError "cudart"))
          (pkgs."nvrtc" or (errorHandler.sysDepError "nvrtc"))
          (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
        ];
        buildable = true;
      };
      exes = {
        "CudaHashMap" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hasktorch" or (errorHandler.buildDepError "hasktorch"))
            (hsPkgs."hasktorch-CudaHashMap" or (errorHandler.buildDepError "hasktorch-CudaHashMap"))
          ];
          buildable = true;
        };
      };
      tests = {
        "CudaHashMap-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hasktorch" or (errorHandler.buildDepError "hasktorch"))
            (hsPkgs."hasktorch-CudaHashMap" or (errorHandler.buildDepError "hasktorch-CudaHashMap"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "CudaHashMap-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."hasktorch" or (errorHandler.buildDepError "hasktorch"))
            (hsPkgs."hasktorch-CudaHashMap" or (errorHandler.buildDepError "hasktorch-CudaHashMap"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = true;
        };
      };
    };
  }