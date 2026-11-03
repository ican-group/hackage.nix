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
      identifier = { name = "polytropos-optics"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "optics-core integration for polytropos open records and variants";
      description = "Integration between <https://hackage.haskell.org/package/polytropos polytropos> and the\n<https://hackage.haskell.org/package/optics optics> \\/ <https://hackage.haskell.org/package/optics-core optics-core> ecosystem.\n\nProvides Van Laarhoven lenses for record fields via 'Polytropos.Optics.fieldLens', first-class\nprisms for variant constructors via 'Polytropos.Optics.ctorOptic', and 'Optics.Label.LabelOptic' instances\nallowing @#fieldName@ lens syntax with @OverloadedLabels@.\n\nStart at the front door module \"Polytropos.Optics\" for complete documentation,\nusage guidelines, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-optics-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-optics" or (errorHandler.buildDepError "polytropos-optics"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }