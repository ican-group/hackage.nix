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
    flags = {
      cross = false;
      low-memory = false;
      system-libarchive = true;
      no-exe = true;
    };
    package = {
      specVersion = "3.0";
      identifier = { name = "libarchive"; version = "3.0.6.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2018-2020 Vanessa McHale";
      maintainer = "vamchale@gmail.com";
      author = "Vanessa McHale";
      homepage = "";
      url = "";
      synopsis = "Haskell interface to libarchive";
      description = "Haskell bindings for [libarchive](https://www.libarchive.org/). Provides the ability to unpack archives, including the ability to unpack archives lazily.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.pkgsBuildBuild.base or (pkgs.pkgsBuildBuild.base or (errorHandler.setupDepError "base")))
        (hsPkgs.pkgsBuildBuild.Cabal or (pkgs.pkgsBuildBuild.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.pkgsBuildBuild.chs-cabal or (pkgs.pkgsBuildBuild.chs-cabal or (errorHandler.setupDepError "chs-cabal")))
      ];
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."composition-prelude" or (errorHandler.buildDepError "composition-prelude"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."unix-compat" or (errorHandler.buildDepError "unix-compat"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
        ] ++ pkgs.lib.optionals (!(compiler.isGhc && compiler.version.ge "8.0")) [
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ]) ++ pkgs.lib.optional (!flags.system-libarchive) (hsPkgs."libarchive-clib" or (errorHandler.buildDepError "libarchive-clib"));
        pkgconfig = pkgs.lib.optional (flags.system-libarchive) (pkgconfPkgs."libarchive" or (errorHandler.pkgConfDepError "libarchive"));
        build-tools = pkgs.lib.optionals (!flags.cross) [
          (hsPkgs.pkgsBuildBuild.c2hs.components.exes.c2hs or (pkgs.pkgsBuildBuild.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          (hsPkgs.pkgsBuildBuild.cpphs.components.exes.cpphs or (pkgs.pkgsBuildBuild.cpphs or (errorHandler.buildToolDepError "cpphs:cpphs")))
        ];
        buildable = true;
      };
      exes = {
        "archive" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."bzlib" or (errorHandler.buildDepError "bzlib"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."libarchive" or (errorHandler.buildDepError "libarchive"))
            (hsPkgs."lzma-static" or (errorHandler.buildDepError "lzma-static"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          ];
          buildable = if flags.no-exe then false else true;
        };
      };
      tests = {
        "libarchive-test" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."libarchive" or (errorHandler.buildDepError "libarchive"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."dir-traverse" or (errorHandler.buildDepError "dir-traverse"))
            (hsPkgs."composition-prelude" or (errorHandler.buildDepError "composition-prelude"))
            (hsPkgs."pathological-bytestrings" or (errorHandler.buildDepError "pathological-bytestrings"))
          ] ++ pkgs.lib.optional (system.isWindows) (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))) ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "8.0")) (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"));
          build-tools = [
            (hsPkgs.pkgsBuildBuild.cpphs.components.exes.cpphs or (pkgs.pkgsBuildBuild.cpphs or (errorHandler.buildToolDepError "cpphs:cpphs")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "libarchive-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."libarchive" or (errorHandler.buildDepError "libarchive"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tar" or (errorHandler.buildDepError "tar"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ];
          buildable = true;
        };
        "mem" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."libarchive" or (errorHandler.buildDepError "libarchive"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
          buildable = true;
        };
      };
    };
  }