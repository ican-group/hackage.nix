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
    flags = { server = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "nova-cache"; version = "0.12.0.1"; };
      license = "Apache-2.0";
      copyright = "2026 Novavero AI Inc.";
      maintainer = "devon.tomlin@novavero.ai";
      author = "Devon Tomlin";
      homepage = "https://github.com/Novavero-AI/nova-cache";
      url = "";
      synopsis = "Nix binary cache protocol: NAR, narinfo, signing and a WAI server";
      description = "The Nix binary cache protocol in Haskell: nix-base32, NAR serialization\n(whole-tree and streaming), narinfo parsing, store paths, Ed25519\nsigning and upload validation, with an optional WAI cache server.\nBounded xz, bzip2 and zstd codecs are the public @nova-cache:xz@,\n@nova-cache:bzip2@ and @nova-cache:zstandard@ sublibraries.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
        ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
        buildable = true;
      };
      sublibs = {
        "xz" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."xz" or (errorHandler.buildDepError "xz"))
          ];
          buildable = true;
        };
        "bzip2" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."bzip2-clib" or (errorHandler.buildDepError "bzip2-clib"))
          ];
          buildable = true;
        };
        "zstandard" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))
          ];
          buildable = true;
        };
      };
      exes = {
        "nova-cache-server" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."nova-cache" or (errorHandler.buildDepError "nova-cache"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-extra" or (errorHandler.buildDepError "wai-extra"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ];
          buildable = if !flags.server then false else true;
        };
      };
      tests = {
        "nova-cache-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."nova-cache" or (errorHandler.buildDepError "nova-cache"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-extra" or (errorHandler.buildDepError "wai-extra"))
          ];
          buildable = true;
        };
        "nova-cache-xz-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."nova-cache".components.sublibs.xz or (errorHandler.buildDepError "nova-cache:xz"))
          ];
          buildable = true;
        };
        "nova-cache-bzip2-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."nova-cache".components.sublibs.bzip2 or (errorHandler.buildDepError "nova-cache:bzip2"))
          ];
          buildable = true;
        };
        "nova-cache-zstd-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."nova-cache".components.sublibs.zstandard or (errorHandler.buildDepError "nova-cache:zstandard"))
          ];
          buildable = true;
        };
      };
    };
  }