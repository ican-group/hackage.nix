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
      identifier = { name = "polytropos-reader-soup"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Composable multi-context Reader monad with zero-overhead row polymorphism";
      description = "A composable, extensible multi-context Reader environment for <https://hackage.haskell.org/package/polytropos polytropos>.\nInstead of defining exponentially growing @MonadFoo@ / @MonadBar@ type class stacks or deeply nested\n@ReaderT@ hierarchies, 'Polytropos.ReaderSoup.ReaderSoup' collects all application contexts in a single\nflat contiguous row ('Polytropos.Record').\n.\nInspired by and acknowledging Yves Parès's pioneering @reader-soup@ package from the\n<https://github.com/funflow/porcupine porcupine> ecosystem, re-architected from scratch\non top of Polytropos's high-performance flat array representation ('Polytropos.Core.Rep')\nand compile-time dictionary synthesis ('Polytropos.Plugin').\n.\nKey Features:\n.\n* Flat multi-context environment ('Polytropos.ReaderSoup.ReaderSoup') backed by Polytropos's $O(1)$ flat array representation.\n* Direct context access ('Polytropos.ReaderSoup.askSoup') via type-level labels or @OverloadedRecordDot@.\n* Structural sub-soup slicing ('Polytropos.ReaderSoup.filtering') via compile-time 'Polytropos.SubRow' projection.\n* Single-context projection ('Polytropos.ReaderSoup.Spoon') giving standard @MonadReader@ instances for isolated subsystems.\n* Context bridging ('Polytropos.ReaderSoup.SoupContext') with 'Polytropos.ReaderSoup.picking', 'Polytropos.ReaderSoup.scooping', and 'Polytropos.ReaderSoup.pouring'.\n* Modular runner composition ('Polytropos.ReaderSoup.ContextRunner', 'Polytropos.ReaderSoup.consumeSoup').\n* Resource management integration ('Polytropos.ReaderSoup.Resource') supporting @resourcet@'s 'Control.Monad.Trans.Resource.ResourceT'.\n.\nStart at the front door module \"Polytropos.ReaderSoup\" for comprehensive documentation and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."safe-exceptions" or (errorHandler.buildDepError "safe-exceptions"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
          (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-reader-soup-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."polytropos-reader-soup" or (errorHandler.buildDepError "polytropos-reader-soup"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          ];
          buildable = true;
        };
      };
    };
  }