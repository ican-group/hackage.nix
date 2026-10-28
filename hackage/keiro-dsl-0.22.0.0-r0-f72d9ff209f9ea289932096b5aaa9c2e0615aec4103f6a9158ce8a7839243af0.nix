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
    flags = { werror-generated = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "keiro-dsl"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Typed specification toolchain for keiro services";
      description = "keiro-dsl is the toolchain over a typed `.keiro` specification of a keiro\nservice: a parser + checker + scaffolder + harness emitter. It emits the\nsymbol-free deterministic layer plus typed holes, never a keiki symbolic\noperator (the firewall invariant).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
          (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
          (hsPkgs."keiro-dsl".components.sublibs.generated-haskell-language-internal or (errorHandler.buildDepError "keiro-dsl:generated-haskell-language-internal"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
          (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      sublibs = {
        "generated-haskell-language-internal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      exes = {
        "keiro-dsl" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "keiro-dsl-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-dsl".components.sublibs.generated-haskell-language-internal or (errorHandler.buildDepError "keiro-dsl:generated-haskell-language-internal"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.keiro-dsl.components.exes.keiro-dsl or (pkgs.pkgsBuildBuild.keiro-dsl or (errorHandler.buildToolDepError "keiro-dsl:keiro-dsl")))
          ];
          buildable = true;
        };
        "keiro-dsl-import-planning-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-haskell-name-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-runtime-vocabulary-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-aggregate-scalars" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-aggregate-scalar-expressions" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-history-dependent-holes" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-behavior-complete" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-domain-outcomes" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-nominal-scalars" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-workspace-nominals" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-structural" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-structural-nominals" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-bare-containers" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-calendar-days" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-structural-text-sets" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-refined-base16" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-mapped-queue" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-mapped-readmodel" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-import-planning" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-codec-compare" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-replay" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-snapshot" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-skeletons" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-coldstart" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-contract" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-contract-declared-id" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-contract-list-fields" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-contract-v1-compat" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-intake-runtime" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-intake-delegated" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-intake-full" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-publisher-runtime" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-queue" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-queue-runtime" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."pgmq-config" or (errorHandler.buildDepError "pgmq-config"))
            (hsPkgs."pgmq-core" or (errorHandler.buildDepError "pgmq-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-readmodel-runtime" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-keyword-segments" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-projection-catalog" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-dispatch-full" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-workflow" = {
          depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = true;
        };
        "keiro-dsl-conformance-workflow-runtime" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-process-full" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-workflow-full" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-process-runtime" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-process-reactions" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-process-timers" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-process-state-authority" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-router-runtime" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-declarative-router" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-router" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-router-full" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-newsurface" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-process" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-v2" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-id-domain-migration" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-id-admission-domains" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-checked-mapping-replay" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."hasql-transaction" or (errorHandler.buildDepError "hasql-transaction"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."keiro-core" or (errorHandler.buildDepError "keiro-core"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."keiro-pgmq" or (errorHandler.buildDepError "keiro-pgmq"))
            (hsPkgs."keiro-test-support" or (errorHandler.buildDepError "keiro-test-support"))
            (hsPkgs."kiroku-store" or (errorHandler.buildDepError "kiroku-store"))
            (hsPkgs."mmzk-typeid" or (errorHandler.buildDepError "mmzk-typeid"))
            (hsPkgs."shibuya-core" or (errorHandler.buildDepError "shibuya-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-mapped-register-construction" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-conformance-mapped-structural-enum-equality" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "keiro-dsl-codec-bench" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."keiki" or (errorHandler.buildDepError "keiki"))
            (hsPkgs."keiro" or (errorHandler.buildDepError "keiro"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "keiro-dsl-parser-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "process-scaling" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."keiro-dsl" or (errorHandler.buildDepError "keiro-dsl"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }