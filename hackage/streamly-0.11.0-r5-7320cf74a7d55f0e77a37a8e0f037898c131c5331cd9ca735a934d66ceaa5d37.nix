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
      fusion-plugin = false;
      inspection = false;
      debug = false;
      internal-dev = false;
      has-llvm = false;
      opt = true;
      limit-build-mem = false;
      internal-use-unliftio = false;
    };
    package = {
      specVersion = "2.4";
      identifier = { name = "streamly"; version = "0.11.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 Composewell Technologies";
      maintainer = "streamly@composewell.com";
      author = "Composewell Technologies";
      homepage = "https://streamly.composewell.com";
      url = "";
      synopsis = "Streaming data pipelines with declarative concurrency";
      description = "For upgrading to streamly-0.9.0+ please read the\n<https://github.com/composewell/streamly/blob/streamly-0.10.0/docs/User/Project/Upgrading-0.8-to-0.9.md Streamly-0.9.0 upgrade guide>.\n\nStreamly is a high-performance, beginner-friendly standard library\nfor Haskell. It unifies streaming with list transformers and logic\nprogramming; unifies streaming with concurrency and reactive\nprogramming; unifies arrays with ring arrays, text, bytestring\nand vector use cases; unifies arrays with builders and binary\nserialization; generalizes parsers to any input type and unifies\nattoparsec, parsec use cases with better performance; provides\nstreaming fileIO — all with a clean, consistent, well-integrated and\nstreaming enabled API.\n\nStreams are designed to have a list like interface — no steep\nlearning curve, no complex types. Streamly is designed to build\ngeneral purpose applications in a truly functional manner, from\nsimple hello-world to advanced high-performance systems. The design\nemphasizes simplicity, modularity, and code reuse with minimal\nbuilding blocks. Performance is on par with C, tuning is easy, and\nit’s hard to get it wrong.\n\nStreamly is serial by default, with seamless declarative concurrency\nthat scales automatically when needed. It provides prompt and safe\nresource management, works well with other streaming libraries as well\nas core libraries like bytestring and text, and is backed by solid\ndocumentation.\n\nThe @streamly@ package is built on top of the @streamly-core@ package\nand offers high-level capabilities such as concurrency, reactive\nprogramming, time-related combinators, lifted exceptions, and\nnetworking. It provides streaming with concurrency, and is a more\npowerful, higher-level and more expressive alternative to the @async@\npackage.\n\nPerformant. Unified. Modular. Powerful. Simple.\n\nLearn more at <https://streamly.composewell.com the streamly website>.";
      buildType = "Configure";
    };
    components = {
      "library" = {
        depends = (((((((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."fusion-plugin-types" or (errorHandler.buildDepError "fusion-plugin-types"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."heaps" or (errorHandler.buildDepError "heaps"))
          (hsPkgs."lockfree-queue" or (errorHandler.buildDepError "lockfree-queue"))
          (hsPkgs."unicode-data" or (errorHandler.buildDepError "unicode-data"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
        ] ++ [
          (hsPkgs."atomic-primops" or (errorHandler.buildDepError "atomic-primops"))
        ]) ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "9.6") (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))) ++ (if flags.internal-use-unliftio
          then [
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          ]
          else [
            (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          ])) ++ pkgs.lib.optional (flags.internal-dev) (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))) ++ pkgs.lib.optional (system.isLinux) (hsPkgs."directory" or (errorHandler.buildDepError "directory"))) ++ pkgs.lib.optional (system.isWindows) (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))) ++ pkgs.lib.optional (system.isOsx) (hsPkgs."directory" or (errorHandler.buildDepError "directory"))) ++ pkgs.lib.optional (flags.inspection) (hsPkgs."inspection-testing" or (errorHandler.buildDepError "inspection-testing"))) ++ pkgs.lib.optional (flags.internal-dev && flags.inspection) (hsPkgs."inspection-and-dev-flags-cannot-be-used-together" or (errorHandler.buildDepError "inspection-and-dev-flags-cannot-be-used-together"));
        frameworks = pkgs.lib.optional (system.isOsx) (pkgs."Cocoa" or (errorHandler.sysDepError "Cocoa"));
        buildable = true;
      };
    };
  }