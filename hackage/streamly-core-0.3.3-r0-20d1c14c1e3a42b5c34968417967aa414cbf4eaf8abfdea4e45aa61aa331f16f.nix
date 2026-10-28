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
      debug = false;
      internal-dev = false;
      has-llvm = false;
      opt = true;
      limit-build-mem = false;
      internal-use-unliftio = false;
      use-unfolds = false;
      use-folds = false;
      force-lstat-readdir = false;
    };
    package = {
      specVersion = "2.4";
      identifier = { name = "streamly-core"; version = "0.3.3"; };
      license = "BSD-3-Clause";
      copyright = "2017 Composewell Technologies";
      maintainer = "streamly@composewell.com";
      author = "Composewell Technologies";
      homepage = "https://streamly.composewell.com";
      url = "";
      synopsis = "Streaming, parsers, arrays, serialization and more";
      description = "For upgrading to streamly-0.9.0+ please read the\n<https://github.com/composewell/streamly/blob/streamly-0.10.0/docs/User/Project/Upgrading-0.8-to-0.9.md Streamly-0.9.0 upgrade guide>.\n\nStreamly is a high-performance, beginner-friendly standard library\nfor Haskell. It unifies streaming with list transformers and logic\nprogramming; unifies streaming with concurrency and reactive\nprogramming; unifies arrays with ring arrays, text, bytestring\nand vector use cases; unifies arrays with builders and binary\nserialization; generalizes parsers to any input type and unifies\nattoparsec, parsec use cases with better performance; provides\nstreaming fileIO — all with a clean, consistent, well-integrated and\nstreaming enabled API.\n\nStreams are designed to have a list like interface — no steep\nlearning curve, no complex types. Streamly is designed to build\ngeneral purpose applications in a truly functional manner, from\nsimple hello-world to advanced high-performance systems. The design\nemphasizes simplicity, modularity, and code reuse with minimal\nbuilding blocks. Performance is on par with C, tuning is easy, and\nit’s hard to get it wrong.\n\nStreamly is serial by default, with seamless declarative concurrency\nthat scales automatically when needed. It provides prompt and safe\nresource management, works well with other streaming libraries as well\nas core libraries like bytestring and text, and is backed by solid\ndocumentation.\n\n@streamly-core@ is a Haskell standard library built on top of @base@\nand GHC boot libraries only. Stream processing abstractions include\nstreams, scans, folds, parsers; and console I/O, file I/O; text\nprocessing.  Array abstractions include pinned, unpinned, mutable,\nimmutable, boxed and unboxed arrays, and ring arrays.  Builders,\nbinary serialization, and deserialization are built-in features of\narrays.\n\nThis package provides a high-performance, unified and ergonomic\nalternative to many disparate packages, such as @streaming, pipes,\nconduit, list-t, logict, foldl, attoparsec, array, primitive,\nvector, vector-algorithms, binary, cereal, store, bytestring, text,\nstringsearch, interpolate, filepath, and path@.\n\nPerformant. Unified. Modular. Powerful. Simple.\n\nLearn more at <https://streamly.composewell.com the streamly website>.";
      buildType = "Configure";
    };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."fusion-plugin-types" or (errorHandler.buildDepError "fusion-plugin-types"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."heaps" or (errorHandler.buildDepError "heaps"))
        ] ++ (if compiler.isGhc && compiler.version.ge "9.0"
          then [
            (hsPkgs."ghc-bignum" or (errorHandler.buildDepError "ghc-bignum"))
          ]
          else [
            (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
          ])) ++ pkgs.lib.optional (!flags.internal-use-unliftio) (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))) ++ pkgs.lib.optional (system.isWindows) (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"));
        buildable = true;
      };
    };
  }