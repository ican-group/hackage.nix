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
      identifier = { name = "cardano-c-clib"; version = "0.1.1.0"; };
      license = "Apache-2.0 AND ISC AND BSD-2-Clause AND CC0-1.0 AND MIT AND (LGPL-3.0-or-later OR GPL-2.0-or-later)";
      copyright = "";
      maintainer = "angel.castillob@protonmail.com";
      author = "Biglup Labs and bundled dependency authors";
      homepage = "https://github.com/Biglup/cometa.hs";
      url = "";
      synopsis = "Bundled cardano-c native sources for Cometa";
      description = "Compiles pinned cardano-c and its six bundled C dependencies with Cabal.\nInstalls the public native headers for Haskell FFI consumers. No CMake,\nGit checkout or installed cardano-c is required when building this package.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."cardano-c-clib".components.sublibs.sodium or (errorHandler.buildDepError "cardano-c-clib:sodium"))
          (hsPkgs."cardano-c-clib".components.sublibs.gmp or (errorHandler.buildDepError "cardano-c-clib:gmp"))
          (hsPkgs."cardano-c-clib".components.sublibs.sha3 or (errorHandler.buildDepError "cardano-c-clib:sha3"))
          (hsPkgs."cardano-c-clib".components.sublibs.ripemd160 or (errorHandler.buildDepError "cardano-c-clib:ripemd160"))
          (hsPkgs."cardano-c-clib".components.sublibs.secp256k1 or (errorHandler.buildDepError "cardano-c-clib:secp256k1"))
          (hsPkgs."cardano-c-clib".components.sublibs.blst or (errorHandler.buildDepError "cardano-c-clib:blst"))
        ];
        libs = pkgs.lib.optionals (!system.isWindows) [
          (pkgs."m" or (errorHandler.sysDepError "m"))
          (pkgs."pthread" or (errorHandler.sysDepError "pthread"))
        ];
        buildable = true;
      };
      sublibs = {
        "sodium" = {
          libs = pkgs.lib.optional (!system.isWindows) (pkgs."pthread" or (errorHandler.sysDepError "pthread"));
          buildable = true;
        };
        "gmp" = { buildable = true; };
        "sha3" = { buildable = true; };
        "ripemd160" = { buildable = true; };
        "secp256k1" = { buildable = true; };
        "blst" = { buildable = true; };
      };
    };
  }