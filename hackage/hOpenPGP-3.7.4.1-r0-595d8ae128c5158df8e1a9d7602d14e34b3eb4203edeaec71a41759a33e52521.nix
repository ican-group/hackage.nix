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
    flags = { use-memory = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "hOpenPGP"; version = "3.7.4.1"; };
      license = "MIT";
      copyright = "2012-2026  Clint Adams";
      maintainer = "Clint Adams <clint@debian.org>";
      author = "Clint Adams";
      homepage = "https://salsa.debian.org/clint/hOpenPGP";
      url = "";
      synopsis = "native Haskell implementation of OpenPGP (RFC9580)";
      description = "native Haskell implementation of OpenPGP (RFC9580), with some backwards compatibility";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."binary-conduit" or (errorHandler.buildDepError "binary-conduit"))
          (hsPkgs."bz2" or (errorHandler.buildDepError "bz2"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."errors" or (errorHandler.buildDepError "errors"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."incremental-parser" or (errorHandler.buildDepError "incremental-parser"))
          (hsPkgs."ixset-typed" or (errorHandler.buildDepError "ixset-typed"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."time-locale-compat" or (errorHandler.buildDepError "time-locale-compat"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          (hsPkgs."asn1-encoding" or (errorHandler.buildDepError "asn1-encoding"))
          (hsPkgs."openpgp-asciiarmor" or (errorHandler.buildDepError "openpgp-asciiarmor"))
        ] ++ (if flags.use-memory
          then [
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."memory" or (errorHandler.buildDepError "memory"))
            (hsPkgs."crypto-cipher-types" or (errorHandler.buildDepError "crypto-cipher-types"))
            (hsPkgs."nettle" or (errorHandler.buildDepError "nettle"))
          ]
          else [
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
            (hsPkgs."nettle" or (errorHandler.buildDepError "nettle"))
          ]);
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."binary-conduit" or (errorHandler.buildDepError "binary-conduit"))
            (hsPkgs."bz2" or (errorHandler.buildDepError "bz2"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."errors" or (errorHandler.buildDepError "errors"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."incremental-parser" or (errorHandler.buildDepError "incremental-parser"))
            (hsPkgs."ixset-typed" or (errorHandler.buildDepError "ixset-typed"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."time-locale-compat" or (errorHandler.buildDepError "time-locale-compat"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
            (hsPkgs."hOpenPGP" or (errorHandler.buildDepError "hOpenPGP"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."openpgp-asciiarmor" or (errorHandler.buildDepError "openpgp-asciiarmor"))
          ] ++ (if flags.use-memory
            then [
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
              (hsPkgs."memory" or (errorHandler.buildDepError "memory"))
              (hsPkgs."crypto-cipher-types" or (errorHandler.buildDepError "crypto-cipher-types"))
              (hsPkgs."nettle" or (errorHandler.buildDepError "nettle"))
            ]
            else [
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
              (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
              (hsPkgs."nettle" or (errorHandler.buildDepError "nettle"))
            ]);
          buildable = true;
        };
      };
      benchmarks = {
        "benchmark" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."binary-conduit" or (errorHandler.buildDepError "binary-conduit"))
            (hsPkgs."bz2" or (errorHandler.buildDepError "bz2"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."errors" or (errorHandler.buildDepError "errors"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."incremental-parser" or (errorHandler.buildDepError "incremental-parser"))
            (hsPkgs."ixset-typed" or (errorHandler.buildDepError "ixset-typed"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."time-locale-compat" or (errorHandler.buildDepError "time-locale-compat"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
            (hsPkgs."hOpenPGP" or (errorHandler.buildDepError "hOpenPGP"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."openpgp-asciiarmor" or (errorHandler.buildDepError "openpgp-asciiarmor"))
          ] ++ (if flags.use-memory
            then [
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
              (hsPkgs."memory" or (errorHandler.buildDepError "memory"))
              (hsPkgs."crypto-cipher-types" or (errorHandler.buildDepError "crypto-cipher-types"))
              (hsPkgs."nettle" or (errorHandler.buildDepError "nettle"))
            ]
            else [
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
              (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
              (hsPkgs."nettle" or (errorHandler.buildDepError "nettle"))
            ]);
          buildable = true;
        };
      };
    };
  }