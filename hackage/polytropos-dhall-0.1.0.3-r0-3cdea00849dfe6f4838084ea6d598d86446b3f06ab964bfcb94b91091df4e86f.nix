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
      identifier = { name = "polytropos-dhall"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "High-performance Dhall codecs and generic adapters for polytropos open rows";
      description = "Linear O(N) 'Dhall.Marshal.Decode.FromDhall' and 'Dhall.Marshal.Encode.ToDhall' codecs\nand generic adapters for <https://hackage.haskell.org/package/polytropos polytropos> open records\nand variants via <https://hackage.haskell.org/package/dhall dhall>.\n\nUnlike \"GHC.Generics\" which builds deeply nested binary tree nodes (@(:*:)@, @(:+:)@)\nduring serialization, @polytropos-dhall@ unrolls the flat contiguous\n'Data.Primitive.SmallArray.SmallArray' payload directly into Dhall record and union literals\nand back. Variants serialize into Dhall union expressions with O(1) constructor tag dispatch.\n\nAlso provides generic adapters via 'Dhall.Marshal.Decode.GenericFromDhall' and\n'Dhall.Marshal.Encode.GenericToDhall' ('Polytropos.Dhall.GenericDhall') enabling\nseamless DerivingVia integration for nominal Haskell types and gachi substrates.\n\nStart at the front door module \"Polytropos.Dhall\" for complete documentation,\ncodec options, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dhall" or (errorHandler.buildDepError "dhall"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."either" or (errorHandler.buildDepError "either"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-dhall-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."dhall" or (errorHandler.buildDepError "dhall"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."either" or (errorHandler.buildDepError "either"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-dhall" or (errorHandler.buildDepError "polytropos-dhall"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }