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
      identifier = { name = "polytropos-docrecords"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Self-documenting extensible records with provenance tracking and CLI generation";
      description = "Self-documenting extensible records for <https://hackage.haskell.org/package/polytropos polytropos>,\nproviding configuration schema extraction, JSON/YAML merging with source provenance, and automated\nCLI parser synthesis via @optparse-applicative@.\n.\nInspired by and acknowledging Yves Parès's pioneering @docrecords@ package from the\n<https://github.com/funflow/porcupine porcupine> ecosystem, re-architected from scratch\non top of Polytropos's high-performance flat array representation ('Polytropos.Core.Rep')\nand compile-time dictionary synthesis ('Polytropos.Plugin').\n.\nKey Features:\n.\n* Extensible documented records ('Polytropos.DocRecord.DocRec') with per-field documentation strings.\n* Tri-state missing value semantics ('Polytropos.DocRecord.PossiblyEmpty') distinguishing unconfigured defaults from missing inputs.\n* Hierarchical provenance tracking ('Polytropos.DocRecord.SourceTag') with deterministic override semantics (@CLI > YAML > Default@).\n* Automated Markdown schema generation ('Polytropos.DocRecord.showDocumentation').\n* Zero-boilerplate CLI synthesis ('Polytropos.DocRecord.parseRecFromCLI') generating @optparse-applicative@ options from record schemas.\n.\nStart at the front door module \"Polytropos.DocRecord\" for comprehensive documentation and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-docrecords-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-docrecords" or (errorHandler.buildDepError "polytropos-docrecords"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          ];
          buildable = true;
        };
      };
    };
  }