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
    flags = { systemlib = false; extension = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "duckdb-ffi"; version = "2.0.1.0"; };
      license = "MPL-2.0";
      copyright = "";
      maintainer = "mpg@mpg.is";
      author = "Matthias Pall Gissurarson";
      homepage = "https://github.com/Tritlo/duckdb-haskell";
      url = "";
      synopsis = "Low-level bindings to the DuckDB C API";
      description = "Haskell FFI bindings generated from the DuckDB 2.0.1 C APIs with hs-bindgen.\nThe V2 bindings include unstable C declarations and require exactly DuckDB 2.0.1.\n\nDownloads the verified DuckDB 2.0.1 release on supported Linux and macOS\nsystems. Also accepts a native library supplied by the user or Nix.\n\nIncludes the complete pinned DuckDB V2 C API.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.pkgsBuildBuild.base or (pkgs.pkgsBuildBuild.base or (errorHandler.setupDepError "base")))
        (hsPkgs.pkgsBuildBuild.Cabal or (pkgs.pkgsBuildBuild.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.pkgsBuildBuild.directory or (pkgs.pkgsBuildBuild.directory or (errorHandler.setupDepError "directory")))
        (hsPkgs.pkgsBuildBuild.filepath or (pkgs.pkgsBuildBuild.filepath or (errorHandler.setupDepError "filepath")))
        (hsPkgs.pkgsBuildBuild.process or (pkgs.pkgsBuildBuild.process or (errorHandler.setupDepError "process")))
        (hsPkgs.pkgsBuildBuild.temporary or (pkgs.pkgsBuildBuild.temporary or (errorHandler.setupDepError "temporary")))
      ];
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hs-bindgen-runtime" or (errorHandler.buildDepError "hs-bindgen-runtime"))
        ];
        libs = if flags.extension
          then pkgs.lib.optional (system.isLinux || system.isOsx) (pkgs."pthread" or (errorHandler.sysDepError "pthread"))
          else [ (pkgs."duckdb" or (errorHandler.sysDepError "duckdb")) ];
        buildable = if flags.extension
          then if system.isLinux || system.isOsx then true else false
          else true;
      };
      tests = {
        "duckdb-ffi-v2-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."duckdb-ffi" or (errorHandler.buildDepError "duckdb-ffi"))
            (hsPkgs."hs-bindgen-runtime" or (errorHandler.buildDepError "hs-bindgen-runtime"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = if flags.extension then false else true;
        };
        "duckdb-ffi-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."duckdb-ffi" or (errorHandler.buildDepError "duckdb-ffi"))
            (hsPkgs."hs-bindgen-runtime" or (errorHandler.buildDepError "hs-bindgen-runtime"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-expected-failure" or (errorHandler.buildDepError "tasty-expected-failure"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = if flags.extension then false else true;
        };
      };
    };
  }