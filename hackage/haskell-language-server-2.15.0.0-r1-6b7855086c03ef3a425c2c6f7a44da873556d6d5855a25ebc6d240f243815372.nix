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
      pedantic = false;
      ignore-plugins-ghc-bounds = false;
      dynamic = true;
      cabalfmt = true;
      isolatecabalfmttests = false;
      cabalgild = true;
      isolatecabalgildtests = false;
      cabal = true;
      class = true;
      callhierarchy = true;
      eval = true;
      importlens = true;
      casesplit = true;
      rename = true;
      ghc-lib = true;
      hlint = true;
      stan = true;
      signaturehelp = true;
      pragmas = true;
      splice = true;
      alternatenumberformat = true;
      qualifyimportednames = true;
      coderange = true;
      changetypesignature = true;
      gadt = true;
      explicitfixity = true;
      explicitfields = true;
      overloadedrecorddot = true;
      fourmolu = true;
      ormolu = true;
      stylishhaskell = true;
      refactor = true;
      semantictokens = true;
      notes = true;
      export = true;
      test-exe = true;
      ghcide-bench = true;
      plugin-tutorial = true;
    };
    package = {
      specVersion = "3.4";
      identifier = { name = "haskell-language-server"; version = "2.15.0.0"; };
      license = "Apache-2.0";
      copyright = "The Haskell IDE Team";
      maintainer = "alan.zimm@gmail.com";
      author = "The Haskell IDE Team";
      homepage = "https://github.com/haskell/haskell-language-server#readme";
      url = "";
      synopsis = "LSP server for GHC";
      description = "Please see the README on GitHub at <https://github.com/haskell/haskell-language-server#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = (((((((((((((((((((((((((((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
          (hsPkgs."githash" or (errorHandler.buildDepError "githash"))
          (hsPkgs."hie-bios" or (errorHandler.buildDepError "hie-bios"))
          (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."optparse-simple" or (errorHandler.buildDepError "optparse-simple"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optional (flags.cabal) (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-plugin"))) ++ pkgs.lib.optional (flags.callhierarchy) (hsPkgs."haskell-language-server".components.sublibs.hls-call-hierarchy-plugin or (errorHandler.buildDepError "haskell-language-server:hls-call-hierarchy-plugin"))) ++ pkgs.lib.optional (flags.cabalfmt && flags.cabal) (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-fmt-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-fmt-plugin"))) ++ pkgs.lib.optional (flags.cabalgild && flags.cabal) (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-gild-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-gild-plugin"))) ++ pkgs.lib.optional (flags.changetypesignature) (hsPkgs."haskell-language-server".components.sublibs.hls-change-type-signature-plugin or (errorHandler.buildDepError "haskell-language-server:hls-change-type-signature-plugin"))) ++ pkgs.lib.optional (flags.class) (hsPkgs."haskell-language-server".components.sublibs.hls-class-plugin or (errorHandler.buildDepError "haskell-language-server:hls-class-plugin"))) ++ pkgs.lib.optional (flags.eval) (hsPkgs."haskell-language-server".components.sublibs.hls-eval-plugin or (errorHandler.buildDepError "haskell-language-server:hls-eval-plugin"))) ++ pkgs.lib.optional (flags.importlens) (hsPkgs."haskell-language-server".components.sublibs.hls-explicit-imports-plugin or (errorHandler.buildDepError "haskell-language-server:hls-explicit-imports-plugin"))) ++ pkgs.lib.optional (flags.casesplit && !(compiler.isGhc && compiler.version.lt "9.14")) (hsPkgs."haskell-language-server".components.sublibs.hls-case-split-plugin or (errorHandler.buildDepError "haskell-language-server:hls-case-split-plugin"))) ++ pkgs.lib.optional (flags.rename) (hsPkgs."haskell-language-server".components.sublibs.hls-rename-plugin or (errorHandler.buildDepError "haskell-language-server:hls-rename-plugin"))) ++ pkgs.lib.optional (flags.hlint && !(compiler.isGhc && (compiler.version.ge "9.10" && compiler.version.lt "9.11")) && !(compiler.isGhc && compiler.version.ge "9.14")) (hsPkgs."haskell-language-server".components.sublibs.hls-hlint-plugin or (errorHandler.buildDepError "haskell-language-server:hls-hlint-plugin"))) ++ pkgs.lib.optional (flags.stan && (compiler.isGhc && compiler.version.lt "9.11" || flags.ignore-plugins-ghc-bounds)) (hsPkgs."haskell-language-server".components.sublibs.hls-stan-plugin or (errorHandler.buildDepError "haskell-language-server:hls-stan-plugin"))) ++ pkgs.lib.optional (flags.signaturehelp) (hsPkgs."haskell-language-server".components.sublibs.hls-signature-help-plugin or (errorHandler.buildDepError "haskell-language-server:hls-signature-help-plugin"))) ++ pkgs.lib.optional (flags.pragmas) (hsPkgs."haskell-language-server".components.sublibs.hls-pragmas-plugin or (errorHandler.buildDepError "haskell-language-server:hls-pragmas-plugin"))) ++ pkgs.lib.optional (flags.splice) (hsPkgs."haskell-language-server".components.sublibs.hls-splice-plugin or (errorHandler.buildDepError "haskell-language-server:hls-splice-plugin"))) ++ pkgs.lib.optional (flags.alternatenumberformat) (hsPkgs."haskell-language-server".components.sublibs.hls-alternate-number-format-plugin or (errorHandler.buildDepError "haskell-language-server:hls-alternate-number-format-plugin"))) ++ pkgs.lib.optional (flags.qualifyimportednames) (hsPkgs."haskell-language-server".components.sublibs.hls-qualify-imported-names-plugin or (errorHandler.buildDepError "haskell-language-server:hls-qualify-imported-names-plugin"))) ++ pkgs.lib.optional (flags.coderange) (hsPkgs."haskell-language-server".components.sublibs.hls-code-range-plugin or (errorHandler.buildDepError "haskell-language-server:hls-code-range-plugin"))) ++ pkgs.lib.optional (flags.gadt) (hsPkgs."haskell-language-server".components.sublibs.hls-gadt-plugin or (errorHandler.buildDepError "haskell-language-server:hls-gadt-plugin"))) ++ pkgs.lib.optional (flags.explicitfixity) (hsPkgs."haskell-language-server".components.sublibs.hls-explicit-fixity-plugin or (errorHandler.buildDepError "haskell-language-server:hls-explicit-fixity-plugin"))) ++ pkgs.lib.optional (flags.explicitfields) (hsPkgs."haskell-language-server".components.sublibs.hls-explicit-record-fields-plugin or (errorHandler.buildDepError "haskell-language-server:hls-explicit-record-fields-plugin"))) ++ pkgs.lib.optional (flags.fourmolu) (hsPkgs."haskell-language-server".components.sublibs.hls-fourmolu-plugin or (errorHandler.buildDepError "haskell-language-server:hls-fourmolu-plugin"))) ++ pkgs.lib.optional (flags.ormolu) (hsPkgs."haskell-language-server".components.sublibs.hls-ormolu-plugin or (errorHandler.buildDepError "haskell-language-server:hls-ormolu-plugin"))) ++ pkgs.lib.optional (flags.stylishhaskell && !(compiler.isGhc && compiler.version.ge "9.14")) (hsPkgs."haskell-language-server".components.sublibs.hls-stylish-haskell-plugin or (errorHandler.buildDepError "haskell-language-server:hls-stylish-haskell-plugin"))) ++ pkgs.lib.optional (flags.refactor) (hsPkgs."haskell-language-server".components.sublibs.hls-refactor-plugin or (errorHandler.buildDepError "haskell-language-server:hls-refactor-plugin"))) ++ pkgs.lib.optional (flags.overloadedrecorddot) (hsPkgs."haskell-language-server".components.sublibs.hls-overloaded-record-dot-plugin or (errorHandler.buildDepError "haskell-language-server:hls-overloaded-record-dot-plugin"))) ++ pkgs.lib.optional (flags.semantictokens) (hsPkgs."haskell-language-server".components.sublibs.hls-semantic-tokens-plugin or (errorHandler.buildDepError "haskell-language-server:hls-semantic-tokens-plugin"))) ++ pkgs.lib.optional (flags.notes) (hsPkgs."haskell-language-server".components.sublibs.hls-notes-plugin or (errorHandler.buildDepError "haskell-language-server:hls-notes-plugin"))) ++ pkgs.lib.optional (flags.export) (hsPkgs."haskell-language-server".components.sublibs.hls-export-plugin or (errorHandler.buildDepError "haskell-language-server:hls-export-plugin"));
        buildable = true;
      };
      sublibs = {
        "hls-cabal-fmt-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."process-extras" or (errorHandler.buildDepError "process-extras"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.cabalfmt || !flags.cabal then false else true;
        };
        "hls-cabal-gild-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."process-extras" or (errorHandler.buildDepError "process-extras"))
          ];
          buildable = if !flags.cabalgild || !flags.cabal then false else true;
        };
        "hls-cabal-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal-syntax" or (errorHandler.buildDepError "Cabal-syntax"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."cabal-add" or (errorHandler.buildDepError "cabal-add"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          ];
          buildable = if !flags.cabal then false else true;
        };
        "hls-class-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghc-exactprint" or (errorHandler.buildDepError "ghc-exactprint"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !flags.class then false else true;
        };
        "hls-call-hierarchy-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hiedb" or (errorHandler.buildDepError "hiedb"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."sqlite-simple" or (errorHandler.buildDepError "sqlite-simple"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.callhierarchy then false else true;
        };
        "hls-eval-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."Diff" or (errorHandler.buildDepError "Diff"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = if !flags.eval then false else true;
        };
        "hls-explicit-imports-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !flags.importlens then false else true;
        };
        "hls-case-split-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-refactor-plugin or (errorHandler.buildDepError "haskell-language-server:hls-refactor-plugin"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."ghc-exactprint" or (errorHandler.buildDepError "ghc-exactprint"))
          ];
          buildable = if !flags.casesplit || compiler.isGhc && compiler.version.lt "9.14"
            then false
            else true;
        };
        "hls-rename-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hiedb" or (errorHandler.buildDepError "hiedb"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-refactor-plugin or (errorHandler.buildDepError "haskell-language-server:hls-refactor-plugin"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."mod" or (errorHandler.buildDepError "mod"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = if !flags.rename then false else true;
        };
        "hls-hlint-plugin" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hlint" or (errorHandler.buildDepError "hlint"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."refact" or (errorHandler.buildDepError "refact"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."ghc-lib-parser-ex" or (errorHandler.buildDepError "ghc-lib-parser-ex"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
          ] ++ pkgs.lib.optional (compiler.isGhc && compiler.version.ge "9.11" || compiler.isGhc && compiler.version.lt "9.10") (hsPkgs."apply-refact" or (errorHandler.buildDepError "apply-refact"))) ++ (if flags.ghc-lib
            then [
              (hsPkgs."ghc-lib-parser" or (errorHandler.buildDepError "ghc-lib-parser"))
            ]
            else [
              (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
              (hsPkgs."ghc-boot" or (errorHandler.buildDepError "ghc-boot"))
            ]);
          buildable = if !flags.hlint || compiler.isGhc && (compiler.version.ge "9.10" && compiler.version.lt "9.11") || compiler.isGhc && compiler.version.ge "9.14"
            then false
            else true;
        };
        "hls-stan-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."stan" or (errorHandler.buildDepError "stan"))
            (hsPkgs."trial" or (errorHandler.buildDepError "trial"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          ];
          buildable = if !flags.stan || compiler.isGhc && compiler.version.gt "9.11" && !flags.ignore-plugins-ghc-bounds
            then false
            else true;
        };
        "hls-signature-help-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !flags.signaturehelp then false else true;
        };
        "hls-pragmas-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."fuzzy" or (errorHandler.buildDepError "fuzzy"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
          buildable = if !flags.pragmas then false else true;
        };
        "hls-splice-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."foldl" or (errorHandler.buildDepError "foldl"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-refactor-plugin or (errorHandler.buildDepError "haskell-language-server:hls-refactor-plugin"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          ];
          buildable = if !flags.splice then false else true;
        };
        "hls-alternate-number-format-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.alternatenumberformat then false else true;
        };
        "hls-qualify-imported-names-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !flags.qualifyimportednames then false else true;
        };
        "hls-code-range-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.coderange then false else true;
        };
        "hls-change-type-signature-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          ];
          buildable = if !flags.changetypesignature then false else true;
        };
        "hls-gadt-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."ghc-exactprint" or (errorHandler.buildDepError "ghc-exactprint"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-refactor-plugin or (errorHandler.buildDepError "haskell-language-server:hls-refactor-plugin"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !flags.gadt then false else true;
        };
        "hls-explicit-fixity-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.explicitfixity then false else true;
        };
        "hls-explicit-record-fields-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          ];
          buildable = if !flags.explicitfields then false else true;
        };
        "hls-overloaded-record-dot-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ];
          buildable = if !flags.overloadedrecorddot then false else true;
        };
        "hls-fourmolu-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."fourmolu" or (errorHandler.buildDepError "fourmolu"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."process-extras" or (errorHandler.buildDepError "process-extras"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          ];
          buildable = if !flags.fourmolu then false else true;
        };
        "hls-ormolu-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."process-extras" or (errorHandler.buildDepError "process-extras"))
            (hsPkgs."ormolu" or (errorHandler.buildDepError "ormolu"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !flags.ormolu then false else true;
        };
        "hls-stylish-haskell-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."stylish-haskell" or (errorHandler.buildDepError "stylish-haskell"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.stylishhaskell || compiler.isGhc && compiler.version.ge "9.14"
            then false
            else true;
        };
        "hls-refactor-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ghc-boot" or (errorHandler.buildDepError "ghc-boot"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-exactprint-utils or (errorHandler.buildDepError "haskell-language-server:hls-exactprint-utils"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."ghc-exactprint" or (errorHandler.buildDepError "ghc-exactprint"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ] ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "9.10") (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"));
          buildable = if !flags.refactor then false else true;
        };
        "hls-semantic-tokens-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."stm-containers" or (errorHandler.buildDepError "stm-containers"))
          ];
          buildable = if !flags.semantictokens then false else true;
        };
        "hls-notes-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = if !flags.notes then false else true;
        };
        "hls-exactprint-utils" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghc-exactprint" or (errorHandler.buildDepError "ghc-exactprint"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
          ];
          buildable = true;
        };
        "hls-export-plugin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            (hsPkgs."ghc-exactprint" or (errorHandler.buildDepError "ghc-exactprint"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-exactprint-utils or (errorHandler.buildDepError "haskell-language-server:hls-exactprint-utils"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
          ];
          buildable = if !flags.export then false else true;
        };
        "ghcide-bench-lib" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."safe-exceptions" or (errorHandler.buildDepError "safe-exceptions"))
            (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
            (hsPkgs."table-layout" or (errorHandler.buildDepError "table-layout"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."row-types" or (errorHandler.buildDepError "row-types"))
          ];
          buildable = true;
        };
      };
      exes = {
        "haskell-language-server" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."haskell-language-server" or (errorHandler.buildDepError "haskell-language-server"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "haskell-language-server-wrapper" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server" or (errorHandler.buildDepError "haskell-language-server"))
            (hsPkgs."hie-bios" or (errorHandler.buildDepError "hie-bios"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          ] ++ (if !system.isWindows
            then [
              (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
              (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ]
            else [
              (hsPkgs."process" or (errorHandler.buildDepError "process"))
            ]);
          buildable = true;
        };
        "ghcide-test-preprocessor" = {
          depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = if !flags.test-exe then false else true;
        };
        "ghcide-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."safe-exceptions" or (errorHandler.buildDepError "safe-exceptions"))
            (hsPkgs."hls-graph" or (errorHandler.buildDepError "hls-graph"))
            (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."haskell-language-server".components.sublibs.ghcide-bench-lib or (errorHandler.buildDepError "haskell-language-server:ghcide-bench-lib"))
          ];
          buildable = if !flags.ghcide-bench then false else true;
        };
        "plugin-tutorial" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."markdown-unlit" or (errorHandler.buildDepError "markdown-unlit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.markdown-unlit.components.exes.markdown-unlit or (pkgs.pkgsBuildBuild.markdown-unlit or (errorHandler.buildToolDepError "markdown-unlit:markdown-unlit")))
          ];
          buildable = if flags.plugin-tutorial && (compiler.isGhc && compiler.version.ge "9.6" && (compiler.isGhc && compiler.version.lt "9.10"))
            then true
            else false;
        };
      };
      tests = {
        "hls-cabal-fmt-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-plugin"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-fmt-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-fmt-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ];
          build-tools = pkgs.lib.optional (flags.isolatecabalfmttests) (hsPkgs.pkgsBuildBuild.cabal-fmt.components.exes.cabal-fmt or (pkgs.pkgsBuildBuild.cabal-fmt or (errorHandler.buildToolDepError "cabal-fmt:cabal-fmt")));
          buildable = if !flags.cabalfmt || !flags.cabal then false else true;
        };
        "hls-cabal-gild-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-plugin"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-gild-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-gild-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ];
          build-tools = pkgs.lib.optional (flags.isolatecabalgildtests) (hsPkgs.pkgsBuildBuild.cabal-gild.components.exes.cabal-gild or (pkgs.pkgsBuildBuild.cabal-gild or (errorHandler.buildToolDepError "cabal-gild:cabal-gild")));
          buildable = if !flags.cabalgild || !flags.cabal then false else true;
        };
        "hls-cabal-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal-syntax" or (errorHandler.buildDepError "Cabal-syntax"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-cabal-plugin or (errorHandler.buildDepError "haskell-language-server:hls-cabal-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.cabal then false else true;
        };
        "hls-class-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-class-plugin or (errorHandler.buildDepError "haskell-language-server:hls-class-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.class then false else true;
        };
        "hls-call-hierarchy-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-call-hierarchy-plugin or (errorHandler.buildDepError "haskell-language-server:hls-call-hierarchy-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.callhierarchy then false else true;
        };
        "hls-eval-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-eval-plugin or (errorHandler.buildDepError "haskell-language-server:hls-eval-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.eval then false else true;
        };
        "hls-explicit-imports-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-explicit-imports-plugin or (errorHandler.buildDepError "haskell-language-server:hls-explicit-imports-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.importlens then false else true;
        };
        "hls-case-split-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-case-split-plugin or (errorHandler.buildDepError "haskell-language-server:hls-case-split-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.casesplit || compiler.isGhc && compiler.version.lt "9.14"
            then false
            else true;
        };
        "hls-rename-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-rename-plugin or (errorHandler.buildDepError "haskell-language-server:hls-rename-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.rename then false else true;
        };
        "hls-hlint-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-hlint-plugin or (errorHandler.buildDepError "haskell-language-server:hls-hlint-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.hlint || compiler.isGhc && (compiler.version.ge "9.10" && compiler.version.lt "9.11") || compiler.isGhc && compiler.version.ge "9.14"
            then false
            else true;
        };
        "hls-stan-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-stan-plugin or (errorHandler.buildDepError "haskell-language-server:hls-stan-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.stan || compiler.isGhc && compiler.version.gt "9.11" && !flags.ignore-plugins-ghc-bounds
            then false
            else true;
        };
        "hls-signature-help-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-signature-help-plugin or (errorHandler.buildDepError "haskell-language-server:hls-signature-help-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.signaturehelp then false else true;
        };
        "hls-pragmas-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-pragmas-plugin or (errorHandler.buildDepError "haskell-language-server:hls-pragmas-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.pragmas then false else true;
        };
        "hls-splice-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-splice-plugin or (errorHandler.buildDepError "haskell-language-server:hls-splice-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.splice then false else true;
        };
        "hls-alternate-number-format-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-alternate-number-format-plugin or (errorHandler.buildDepError "haskell-language-server:hls-alternate-number-format-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.alternatenumberformat then false else true;
        };
        "hls-qualify-imported-names-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-qualify-imported-names-plugin or (errorHandler.buildDepError "haskell-language-server:hls-qualify-imported-names-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ];
          buildable = if !flags.qualifyimportednames then false else true;
        };
        "hls-code-range-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-code-range-plugin or (errorHandler.buildDepError "haskell-language-server:hls-code-range-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.coderange then false else true;
        };
        "hls-change-type-signature-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-change-type-signature-plugin or (errorHandler.buildDepError "haskell-language-server:hls-change-type-signature-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.changetypesignature then false else true;
        };
        "hls-gadt-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-gadt-plugin or (errorHandler.buildDepError "haskell-language-server:hls-gadt-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.gadt then false else true;
        };
        "hls-explicit-fixity-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-explicit-fixity-plugin or (errorHandler.buildDepError "haskell-language-server:hls-explicit-fixity-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.explicitfixity then false else true;
        };
        "hls-explicit-record-fields-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-explicit-record-fields-plugin or (errorHandler.buildDepError "haskell-language-server:hls-explicit-record-fields-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ];
          buildable = if !flags.explicitfields then false else true;
        };
        "hls-overloaded-record-dot-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-overloaded-record-dot-plugin or (errorHandler.buildDepError "haskell-language-server:hls-overloaded-record-dot-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ];
          buildable = if !flags.overloadedrecorddot then false else true;
        };
        "hls-fourmolu-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-fourmolu-plugin or (errorHandler.buildDepError "haskell-language-server:hls-fourmolu-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.fourmolu.components.exes.fourmolu or (pkgs.pkgsBuildBuild.fourmolu or (errorHandler.buildToolDepError "fourmolu:fourmolu")))
          ];
          buildable = if !flags.fourmolu then false else true;
        };
        "hls-ormolu-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-ormolu-plugin or (errorHandler.buildDepError "haskell-language-server:hls-ormolu-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."ormolu" or (errorHandler.buildDepError "ormolu"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.ormolu.components.exes.ormolu or (pkgs.pkgsBuildBuild.ormolu or (errorHandler.buildToolDepError "ormolu:ormolu")))
          ];
          buildable = if !flags.ormolu then false else true;
        };
        "hls-stylish-haskell-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-stylish-haskell-plugin or (errorHandler.buildDepError "haskell-language-server:hls-stylish-haskell-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ];
          buildable = if !flags.stylishhaskell || compiler.isGhc && compiler.version.ge "9.14"
            then false
            else true;
        };
        "hls-refactor-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-refactor-plugin or (errorHandler.buildDepError "haskell-language-server:hls-refactor-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."parser-combinators" or (errorHandler.buildDepError "parser-combinators"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.refactor then false else true;
        };
        "hls-semantic-tokens-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-semantic-tokens-plugin or (errorHandler.buildDepError "haskell-language-server:hls-semantic-tokens-plugin"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
          ];
          buildable = if !flags.semantictokens then false else true;
        };
        "hls-notes-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-notes-plugin or (errorHandler.buildDepError "haskell-language-server:hls-notes-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ];
          buildable = if !flags.notes then false else true;
        };
        "hls-export-plugin-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.hls-export-plugin or (errorHandler.buildDepError "haskell-language-server:hls-export-plugin"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.export then false else true;
        };
        "func-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ] ++ pkgs.lib.optional (flags.refactor) (hsPkgs."haskell-language-server".components.sublibs.hls-refactor-plugin or (errorHandler.buildDepError "haskell-language-server:hls-refactor-plugin"));
          build-tools = [
            (hsPkgs.pkgsBuildBuild.haskell-language-server.components.exes.haskell-language-server or (pkgs.pkgsBuildBuild.haskell-language-server or (errorHandler.buildToolDepError "haskell-language-server:haskell-language-server")))
          ];
          buildable = true;
        };
        "wrapper-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.haskell-language-server.components.exes.haskell-language-server-wrapper or (pkgs.pkgsBuildBuild.haskell-language-server-wrapper or (errorHandler.buildToolDepError "haskell-language-server:haskell-language-server-wrapper")))
            (hsPkgs.pkgsBuildBuild.haskell-language-server.components.exes.haskell-language-server or (pkgs.pkgsBuildBuild.haskell-language-server or (errorHandler.buildToolDepError "haskell-language-server:haskell-language-server")))
          ];
          buildable = true;
        };
        "ghcide-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."enummapset" or (errorHandler.buildDepError "enummapset"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghcide" or (errorHandler.buildDepError "ghcide"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."list-t" or (errorHandler.buildDepError "list-t"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
            (hsPkgs."sqlite-simple" or (errorHandler.buildDepError "sqlite-simple"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."stm-containers" or (errorHandler.buildDepError "stm-containers"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-expected-failure" or (errorHandler.buildDepError "tasty-expected-failure"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-rerun" or (errorHandler.buildDepError "tasty-rerun"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-rope" or (errorHandler.buildDepError "text-rope"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."hls-test-utils" or (errorHandler.buildDepError "hls-test-utils"))
          ] ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "9.3") (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"));
          build-tools = [
            (hsPkgs.pkgsBuildBuild.ghcide.components.exes.ghcide or (pkgs.pkgsBuildBuild.ghcide or (errorHandler.buildToolDepError "ghcide:ghcide")))
            (hsPkgs.pkgsBuildBuild.haskell-language-server.components.exes.ghcide-test-preprocessor or (pkgs.pkgsBuildBuild.ghcide-test-preprocessor or (errorHandler.buildToolDepError "haskell-language-server:ghcide-test-preprocessor")))
            (hsPkgs.pkgsBuildBuild.implicit-hie.components.exes.gen-hie or (pkgs.pkgsBuildBuild.gen-hie or (errorHandler.buildToolDepError "implicit-hie:gen-hie")))
          ];
          buildable = true;
        };
        "ghcide-bench-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."haskell-language-server".components.sublibs.ghcide-bench-lib or (errorHandler.buildDepError "haskell-language-server:ghcide-bench-lib"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-rerun" or (errorHandler.buildDepError "tasty-rerun"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.ghcide.components.exes.ghcide or (pkgs.pkgsBuildBuild.ghcide or (errorHandler.buildToolDepError "ghcide:ghcide")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haskell-language-server".components.sublibs.ghcide-bench-lib or (errorHandler.buildDepError "haskell-language-server:ghcide-bench-lib"))
            (hsPkgs."haskell-language-server" or (errorHandler.buildDepError "haskell-language-server"))
            (hsPkgs."hls-plugin-api" or (errorHandler.buildDepError "hls-plugin-api"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lens-aeson" or (errorHandler.buildDepError "lens-aeson"))
            (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
            (hsPkgs."shake-bench" or (errorHandler.buildDepError "shake-bench"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.haskell-language-server.components.exes.ghcide-bench or (pkgs.pkgsBuildBuild.ghcide-bench or (errorHandler.buildToolDepError "haskell-language-server:ghcide-bench")))
          ];
          buildable = true;
        };
      };
    };
  }