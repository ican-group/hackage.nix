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
      identifier = { name = "filepath"; version = "1.5.5.0"; };
      license = "BSD-3-Clause";
      copyright = "Neil Mitchell 2005-2020, Julian Ospald 2021-2022";
      maintainer = "Julian Ospald <hasufell@posteo.de>";
      author = "Neil Mitchell <ndmitchell@gmail.com>";
      homepage = "https://github.com/haskell/filepath/blob/master/README.md";
      url = "";
      synopsis = "Library for manipulating FilePaths in a cross platform way.";
      description = "This package provides functionality for manipulating @FilePath@ values, and is shipped with <https://www.haskell.org/ghc/ GHC>. It provides two variants for filepaths:\n\n1. legacy filepaths: @type FilePath = String@\n\n2. operating system abstracted filepaths (@OsPath@): internally unpinned @ShortByteString@ (platform-dependent encoding)\n\nIt is recommended to use @OsPath@ when possible, because it is more correct.\n\nFor each variant there are three main modules:\n\n* \"System.FilePath.Posix\" / \"System.OsPath.Posix\" manipulates POSIX\\/Linux style @FilePath@ values (with @\\/@ as the path separator).\n\n* \"System.FilePath.Windows\" / \"System.OsPath.Windows\" manipulates Windows style @FilePath@ values (with either @\\\\@ or @\\/@ as the path separator, and deals with drives).\n\n* \"System.FilePath\" / \"System.OsPath\" for dealing with current platform-specific filepaths\n\nFor more powerful string manipulation of @OsPath@, you can use the <https://hackage.haskell.org/package/os-string os-string package> (@OsPath@ is a type synonym for @OsString@).\n\nAn introduction into the new API can be found in this\n<https://hasufell.github.io/posts/2022-06-29-fixing-haskell-filepaths.html blog post>.\nCode examples for the new API can be found <https://github.com/hasufell/filepath-examples here>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
        ] ++ (if compiler.isGhc && compiler.version.lt "9.14"
          then [
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ]
          else pkgs.lib.optionals (compiler.isGhc && true) [
            (hsPkgs."template-haskell-lift" or (errorHandler.buildDepError "template-haskell-lift"))
            (hsPkgs."template-haskell-quasiquoter" or (errorHandler.buildDepError "template-haskell-quasiquoter"))
          ]);
        build-tools = pkgs.lib.optional (flags.cpphs) (hsPkgs.pkgsBuildBuild.cpphs.components.exes.cpphs or (pkgs.pkgsBuildBuild.cpphs or (errorHandler.buildToolDepError "cpphs:cpphs")));
        buildable = true;
      };
      tests = {
        "filepath-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
        "filepath-equivalent-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-random" or (errorHandler.buildDepError "generic-random"))
            (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
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
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."quickcheck-classes-base" or (errorHandler.buildDepError "quickcheck-classes-base"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
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
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = true;
        };
      };
    };
  }