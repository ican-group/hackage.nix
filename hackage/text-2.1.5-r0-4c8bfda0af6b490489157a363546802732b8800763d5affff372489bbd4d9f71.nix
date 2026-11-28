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
      developer = false;
      simdutf = true;
      pure-haskell = false;
      extendedbenchmarks = false;
    };
    package = {
      specVersion = "2.2";
      identifier = { name = "text"; version = "2.1.5"; };
      license = "BSD-2-Clause";
      copyright = "2009-2011 Bryan O'Sullivan, 2008-2009 Tom Harper, 2021 Andrew Lelechenko";
      maintainer = "Haskell Text Team <andrew.lelechenko@gmail.com>, Core Libraries Committee";
      author = "Bryan O'Sullivan <bos@serpentine.com>";
      homepage = "https://github.com/haskell/text";
      url = "";
      synopsis = "An efficient packed Unicode text type.";
      description = "\nAn efficient packed, immutable Unicode text type (both strict and\nlazy).\n\nThe 'Text' type represents Unicode character strings, in a time and\nspace-efficient manner. This package provides text processing\ncapabilities that are optimized for performance critical use, both\nin terms of large data quantities and high speed.\n\nThe 'Text' type provides character-encoding, type-safe case\nconversion via whole-string case conversion functions (see \"Data.Text\").\nIt also provides a range of functions for converting 'Text' values to\nand from 'ByteStrings', using several standard encodings\n(see \"Data.Text.Encoding\").\n\nEfficient locale-sensitive support for text IO is also supported\n(see \"Data.Text.IO\").\n\nThese modules are intended to be imported qualified, to avoid name\nclashes with Prelude functions, e.g.\n\n> import qualified Data.Text as T\n\n== ICU Support\n\nTo use an extended and very rich family of functions for working\nwith Unicode text (including normalization, regular expressions,\nnon-standard encodings, text breaking, and locales), see\nthe [text-icu package](https://hackage.haskell.org/package/text-icu)\nbased on the well-respected and liberally\nlicensed [ICU library](http://site.icu-project.org/).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ((((((([
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
        ] ++ pkgs.lib.optionals (flags.simdutf && !(system.isJavaScript || flags.pure-haskell)) (pkgs.lib.optional (compiler.isGhc && compiler.version.ge "9.4") (hsPkgs."system-cxx-std-lib" or (errorHandler.buildDepError "system-cxx-std-lib")))) ++ pkgs.lib.optional (flags.simdutf && system.isWindows && (compiler.isGhc && (compiler.version.ge "8.8" && compiler.version.lt "8.10.5" || compiler.version.eq "9.0.1"))) (hsPkgs."base" or (errorHandler.buildDepError "base"))) ++ pkgs.lib.optional (system.isWindows && (compiler.isGhc && (compiler.version.ge "8.2" && compiler.version.lt "8.4" || compiler.version.eq "8.6.3" || compiler.version.eq "8.10.1"))) (hsPkgs."base" or (errorHandler.buildDepError "base"))) ++ pkgs.lib.optional ((system.isAarch64 || system.isArm) && (compiler.isGhc && (compiler.version.ge "8.10" && compiler.version.lt "8.11"))) (hsPkgs."base" or (errorHandler.buildDepError "base"))) ++ pkgs.lib.optional ((system.isAarch64 || system.isArm) && (compiler.isGhc && compiler.version.eq "9.2.1")) (hsPkgs."base" or (errorHandler.buildDepError "base"))) ++ pkgs.lib.optional (flags.simdutf && system.isNetbsd && (compiler.isGhc && compiler.version.lt "9.4")) (hsPkgs."base" or (errorHandler.buildDepError "base"))) ++ (if compiler.isGhc && compiler.version.lt "9.14"
          then [
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ]
          else [
            (hsPkgs."template-haskell-lift" or (errorHandler.buildDepError "template-haskell-lift"))
          ])) ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "9.4") (hsPkgs."data-array-byte" or (errorHandler.buildDepError "data-array-byte"));
        libs = pkgs.lib.optionals (flags.simdutf && !(system.isJavaScript || flags.pure-haskell)) (pkgs.lib.optionals (!(compiler.isGhc && compiler.version.ge "9.4")) (if system.isOsx || system.isFreebsd
          then [ (pkgs."c++" or (errorHandler.sysDepError "c++")) ]
          else if system.isOpenbsd
            then [
              (pkgs."c++" or (errorHandler.sysDepError "c++"))
              (pkgs."c++abi" or (errorHandler.sysDepError "c++abi"))
              (pkgs."pthread" or (errorHandler.sysDepError "pthread"))
            ]
            else if system.isWindows
              then if compiler.isGhc && compiler.version.lt "9.3"
                then [ (pkgs."stdc++" or (errorHandler.sysDepError "stdc++")) ]
                else [
                  (pkgs."c++" or (errorHandler.sysDepError "c++"))
                  (pkgs."c++abi" or (errorHandler.sysDepError "c++abi"))
                ]
              else if system.isWasm32
                then [
                  (pkgs."c++" or (errorHandler.sysDepError "c++"))
                  (pkgs."c++abi" or (errorHandler.sysDepError "c++abi"))
                ]
                else [
                  (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
                ]));
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = ((([
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ] ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "9.4") (hsPkgs."data-array-byte" or (errorHandler.buildDepError "data-array-byte"))) ++ (if compiler.isGhc && compiler.version.lt "9.14"
            then [
              (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            ]
            else [
              (hsPkgs."template-haskell-lift" or (errorHandler.buildDepError "template-haskell-lift"))
            ])) ++ pkgs.lib.optional (compiler.isGhc && (compiler.version.ge "8.2.1" && compiler.version.lt "8.6" || compiler.version.ge "8.6.2" && compiler.version.lt "9.2" || compiler.version.ge "9.2.2")) (hsPkgs."tasty-inspection-testing" or (errorHandler.buildDepError "tasty-inspection-testing"))) ++ pkgs.lib.optional (system.isOpenbsd) (hsPkgs."splitmix" or (errorHandler.buildDepError "splitmix"));
          buildable = true;
        };
      };
      benchmarks = {
        "text-benchmarks" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
      };
    };
  }