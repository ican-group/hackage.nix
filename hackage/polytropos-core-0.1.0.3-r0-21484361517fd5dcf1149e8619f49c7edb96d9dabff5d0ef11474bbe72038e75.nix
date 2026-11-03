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
      identifier = { name = "polytropos-core"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Row-polymorphic / open ADTs: rows, generic representation, evidence";
      description = "Core engine and consumer surface of <https://hackage.haskell.org/package/polytropos polytropos>:\nrow-polymorphic extensible records and variants for Haskell.\n\nThe package collapses the four quadrants of the design space (nominal products,\nstructural products, nominal sums, and structural sums) into one uniform generic\nrepresentation ('Polytropos.Core.Rep'): a runtime integer tag plus a contiguous, flat\n'Data.Primitive.SmallArray.SmallArray' of payload slots.\n\nFor application development and daily usage, start at the front door module\n\"Polytropos\", which exposes ergonomic constructors, pattern synonyms, and\nworked examples. For compiler plugins and low-level substrate primitives, see\n\"Polytropos.Core\".\n\nFor design decisions, memory physics, and background on the OCaml polymorphic variant\nheritage, see <https://github.com/NadiaYvette/polytropos/blob/master/docs/notes/POLYTROPOS_DESIGN.md POLYTROPOS_DESIGN.md>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-core-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }