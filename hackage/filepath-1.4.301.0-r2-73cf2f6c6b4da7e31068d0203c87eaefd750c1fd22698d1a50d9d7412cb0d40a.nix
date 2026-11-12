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
    flags = { cpphs = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "filepath"; version = "1.4.301.0"; };
      license = "BSD-3-Clause";
      copyright = "Neil Mitchell 2005-2020, Julain Ospald 2021-2022";
      maintainer = "Julian Ospald <hasufell@posteo.de>";
      author = "Neil Mitchell <ndmitchell@gmail.com>";
      homepage = "https://github.com/haskell/filepath/blob/master/README.md";
      url = "";
      synopsis = "Library for manipulating FilePaths in a cross platform way.";
      description = "This package provides functionality for manipulating @FilePath@ values, and is shipped with <https://www.haskell.org/ghc/ GHC>. It provides two variants for filepaths:\n\n1. legacy filepaths: @type FilePath = String@\n\n2. operating system abstracted filepaths (@OsPath@): internally unpinned @ShortByteString@ (platform-dependent encoding)\n\nIt is recommended to use @OsPath@ when possible, because it is more correct.\n\nFor each variant there are three main modules:\n\n* \"System.FilePath.Posix\" / \"System.OsPath.Posix\" manipulates POSIX\\/Linux style @FilePath@ values (with @\\/@ as the path separator).\n\n* \"System.FilePath.Windows\" / \"System.OsPath.Windows\" manipulates Windows style @FilePath@ values (with either @\\\\@ or @\\/@ as the path separator, and deals with drives).\n\n* \"System.FilePath\" / \"System.OsPath\" for dealing with current platform-specific filepaths\n\n\"System.OsString\" is like \"System.OsPath\", but more general purpose. Refer to the documentation of\nthose modules for more information.\n\nAn introduction into the new API can be found in this\n<https://hasufell.github.io/posts/2022-06-29-fixing-haskell-filepaths.html blog post>.\nCode examples for the new API can be found <https://github.com/hasufell/filepath-examples here>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
        ];
        build-tools = pkgs.lib.optional (flags.cpphs) (hsPkgs.pkgsBuildBuild.cpphs.components.exes.cpphs or (pkgs.pkgsBuildBuild.cpphs or (errorHandler.buildToolDepError "cpphs:cpphs")));
        buildable = true;
      };
      tests = {
        "filepath-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
        "filepath-equivalent-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
        "bytestring-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
        "abstract-filepath" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-classes-base" or (errorHandler.buildDepError "quickcheck-classes-base"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "bench-filepath" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = true;
        };
      };
    };
  }