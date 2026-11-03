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
      identifier = { name = "polytropos-lens"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Comprehensive lens-suite integration for polytropos open records and variants";
      description = "Comprehensive optics integration between <https://hackage.haskell.org/package/polytropos polytropos> open records and variants\nand Edward Kmett's <https://hackage.haskell.org/package/lens lens> ecosystem.\n\nBridges the unified flat runtime representation 'Polytropos.Core.Rep' to standard \"Control.Lens\" typeclasses:\npositional lenses ('Control.Lens.Tuple.Field1' through 'Control.Lens.Tuple.Field9'), label-based lenses ('Polytropos.Lens.fieldLens'),\ncontainer indexing ('Control.Lens.At.Ixed' and 'Control.Lens.At.At' keyed by field name), single-pass homogeneous\ntraversals ('Control.Lens.Each.Each'), and first-class profunctor prisms ('Polytropos.Lens.prismVariant') for open\nvariant constructors with O(1) tag dispatch.\n\nKeeps the core @polytropos@ packages lightweight and free from transitive dependencies.\n\nStart at the front door module \"Polytropos.Lens\" for complete documentation,\nusage guidelines, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-lens-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-lens" or (errorHandler.buildDepError "polytropos-lens"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }