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
    flags = { ordered-keymap = true; };
    package = {
      specVersion = "2.2";
      identifier = { name = "aeson"; version = "2.3.3.0"; };
      license = "BSD-3-Clause";
      copyright = "2014-2026 Aeson project contributors,\n2011-2016 Bryan O'Sullivan,\n2011 MailRank, Inc.";
      maintainer = "Li-yao Xia <lysxia@gmail.com>,\nCore Libraries Committee";
      author = "Bryan O'Sullivan <bos@serpentine.com>";
      homepage = "https://github.com/haskell/aeson";
      url = "";
      synopsis = "Fast JSON parsing and encoding";
      description = "A JSON parsing and encoding library optimized for ease of use\nand high performance.\n\nTo get started, see the documentation for the @Data.Aeson@ module\nbelow.\n\n(A note on naming: in Greek mythology, Aeson was the father of Jason.)";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."time-compat" or (errorHandler.buildDepError "time-compat"))
          (hsPkgs."character-ps" or (errorHandler.buildDepError "character-ps"))
          (hsPkgs."data-fix" or (errorHandler.buildDepError "data-fix"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."indexed-traversable" or (errorHandler.buildDepError "indexed-traversable"))
          (hsPkgs."integer-conversion" or (errorHandler.buildDepError "integer-conversion"))
          (hsPkgs."integer-logarithms" or (errorHandler.buildDepError "integer-logarithms"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."OneTuple" or (errorHandler.buildDepError "OneTuple"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."semialign" or (errorHandler.buildDepError "semialign"))
          (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."text-iso8601" or (errorHandler.buildDepError "text-iso8601"))
          (hsPkgs."text-short" or (errorHandler.buildDepError "text-short"))
          (hsPkgs."th-abstraction" or (errorHandler.buildDepError "th-abstraction"))
          (hsPkgs."these" or (errorHandler.buildDepError "these"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."witherable" or (errorHandler.buildDepError "witherable"))
        ] ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "9.4")) (hsPkgs."generically" or (errorHandler.buildDepError "generically"))) ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "9.0")) (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"));
        buildable = true;
      };
      tests = {
        "aeson-tests" = {
          depends = ([
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
            (hsPkgs."base-orphans" or (errorHandler.buildDepError "base-orphans"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-fix" or (errorHandler.buildDepError "data-fix"))
            (hsPkgs."Diff" or (errorHandler.buildDepError "Diff"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
            (hsPkgs."generically" or (errorHandler.buildDepError "generically"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."indexed-traversable" or (errorHandler.buildDepError "indexed-traversable"))
            (hsPkgs."integer-logarithms" or (errorHandler.buildDepError "integer-logarithms"))
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
            (hsPkgs."OneTuple" or (errorHandler.buildDepError "OneTuple"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
            (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-short" or (errorHandler.buildDepError "text-short"))
            (hsPkgs."these" or (errorHandler.buildDepError "these"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."time-compat" or (errorHandler.buildDepError "time-compat"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ] ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "9.0")) (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))) ++ pkgs.lib.optional (compiler.isGhc && (compiler.version.ge "9.2" && compiler.version.lt "9.7")) (hsPkgs."nothunks" or (errorHandler.buildDepError "nothunks"));
          buildable = true;
        };
      };
    };
  }