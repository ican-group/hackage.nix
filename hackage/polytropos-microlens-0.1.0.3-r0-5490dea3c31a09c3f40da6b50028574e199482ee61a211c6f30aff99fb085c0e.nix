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
      identifier = { name = "polytropos-microlens"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Lightweight microlens optics integration for polytropos open records";
      description = "Lightweight optics integration between <https://hackage.haskell.org/package/polytropos polytropos> open records\nand <https://hackage.haskell.org/package/microlens microlens>.\n\nDesigned specifically for codebases prioritizing fast compilation times and zero\ntransitive dependency bloat: depends strictly on @base@, <https://hackage.haskell.org/package/microlens microlens>,\n<https://hackage.haskell.org/package/polytropos-core polytropos-core>, and <https://hackage.haskell.org/package/polytropos-plugin polytropos-plugin>.\n\nProvides O(1) field lenses via 'Polytropos.Microlens.fieldLens' (with slot indices emitted as literals\nby the TcPlugin) and homogeneous single-pass traversals over flat contiguous\npayload arrays via 'Lens.Micro.each'.\n\nStart at the front door module \"Polytropos.Microlens\" for complete documentation,\nusage guidelines, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-microlens-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-microlens" or (errorHandler.buildDepError "polytropos-microlens"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }