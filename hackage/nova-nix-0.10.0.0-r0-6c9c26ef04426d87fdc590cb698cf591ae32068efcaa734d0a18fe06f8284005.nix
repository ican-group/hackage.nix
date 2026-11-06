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
      identifier = { name = "nova-nix"; version = "0.10.0.0"; };
      license = "Apache-2.0";
      copyright = "2026 Novavero AI Inc.";
      maintainer = "devon.tomlin@novavero.ai";
      author = "Devon Tomlin";
      homepage = "https://github.com/Novavero-AI/nova-nix";
      url = "";
      synopsis = "Windows-native Nix implementation in Haskell and C99";
      description = "An implementation of Nix for Windows, written in Haskell with a C99\ndata layer that keeps evaluation data off the GHC heap.  It also runs\non macOS and Linux.  It has its own parser, lazy evaluator, store,\nderivation builder and binary-cache substituter, and does not need an\nexisting Nix installation.\n\nOn the derivations its CI checks, over pinned pairs of Nix and nixpkgs,\nthe derivation paths it computes match upstream's.  On Windows it builds\npackages from source through a stage-1 stdenv over prebuilt MinGW-w64\nand MSYS2 packages pinned by SHA-256, and builds GNU Mes from a\n1,623-byte seed.  The project is experimental; see the README for what\nis not implemented.\n\nEvaluation needs the C data layer, so library code must run it between\n@Nix.Eval.Arena.arenaInit@ and @Nix.Eval.Arena.arenaDestroy@.\n\nBuilt on @nova-cache@ for NAR serialization, narinfo handling, and\nEd25519-signed binary substitution.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."filelock" or (errorHandler.buildDepError "filelock"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."nova-cache" or (errorHandler.buildDepError "nova-cache"))
          (hsPkgs."nova-cache".components.sublibs.bzip2 or (errorHandler.buildDepError "nova-cache:bzip2"))
          (hsPkgs."nova-cache".components.sublibs.xz or (errorHandler.buildDepError "nova-cache:xz"))
          (hsPkgs."nova-cache".components.sublibs.zstandard or (errorHandler.buildDepError "nova-cache:zstandard"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
          (hsPkgs."sqlite-simple" or (errorHandler.buildDepError "sqlite-simple"))
          (hsPkgs."tar" or (errorHandler.buildDepError "tar"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))
        ] ++ (if system.isWindows
          then [ (hsPkgs."Win32" or (errorHandler.buildDepError "Win32")) ]
          else [ (hsPkgs."unix" or (errorHandler.buildDepError "unix")) ]);
        buildable = true;
      };
      exes = {
        "nova-nix" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."file-io" or (errorHandler.buildDepError "file-io"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."nova-nix" or (errorHandler.buildDepError "nova-nix"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "nova-nix-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."nova-cache" or (errorHandler.buildDepError "nova-cache"))
            (hsPkgs."nova-cache".components.sublibs.zstandard or (errorHandler.buildDepError "nova-cache:zstandard"))
            (hsPkgs."nova-nix" or (errorHandler.buildDepError "nova-nix"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."sqlite-simple" or (errorHandler.buildDepError "sqlite-simple"))
            (hsPkgs."tar" or (errorHandler.buildDepError "tar"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
            (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))
          ];
          buildable = true;
        };
      };
    };
  }