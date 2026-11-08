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
      support_aesni = true;
      support_rdrand = true;
      support_pclmuldq = true;
      support_sse = false;
      support_s2n_bignum = true;
      integer-gmp = true;
      support_deepseq = true;
      old_toolchain_inliner = false;
      check_alignment = false;
      use_target_attributes = true;
    };
    package = {
      specVersion = "3.0";
      identifier = { name = "crypton"; version = "2.1.6"; };
      license = "BSD-3-Clause AND MIT AND ISC";
      copyright = "2006-2022 Vincent Hanquez <vincent@snarc.org> and contributors,\n2023-2026 Kazu Yamamoto <kazu@iij.ad.jp>";
      maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
      author = "Vincent Hanquez <vincent@snarc.org>";
      homepage = "https://github.com/kazu-yamamoto/crypton";
      url = "";
      synopsis = "Cryptography Primitives";
      description = "`crypton` is a low-level cryptography library.\nTo achieve high performance, it utilizes C and assembly\nlanguage to define FFI bindings, structuring them\nin a way that makes them easy to use.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."base16" or (errorHandler.buildDepError "base16"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
        ] ++ pkgs.lib.optional (system.isWindows) (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))) ++ pkgs.lib.optional (compiler.isGhc && true && flags.integer-gmp) (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))) ++ pkgs.lib.optional (flags.support_deepseq) (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"));
        libs = pkgs.lib.optional (system.isWindows) (pkgs."advapi32" or (errorHandler.sysDepError "advapi32"));
        buildable = true;
      };
      tests = {
        "test-crypton" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "bench-crypton" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = true;
        };
      };
    };
  }