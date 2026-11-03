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
      identifier = { name = "polytropos-plugin"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "TcPlugin that emits literal evidence for Polytropos row classes";
      description = "A GHC typechecker plugin for <https://hackage.haskell.org/package/polytropos polytropos>\nthat solves the evidence-class constraints ('Polytropos.Core.FieldIndex',\n'Polytropos.Core.ConstructorIndex', 'Polytropos.Core.RowEq', 'Polytropos.Core.RowShow',\n'Polytropos.Core.RowEqSum', 'Polytropos.Core.RowShowSum', 'Polytropos.Core.AllFields')\nby inspecting the row carried in a 'Polytropos.Core.RowRep''s type and emitting literal\nslot indices, tags, and dictionary vectors directly into GHC Core AST — eliminating\ninductive type-level search and pointer-chasing runtime overhead entirely.\n\nUses the <https://hackage.haskell.org/package/ghc-tcplugin-api ghc-tcplugin-api> library\nfor a streamlined interface to GHC's typechecker plugin API across compiler versions.\n\nStart at the front door module \"Polytropos.Plugin\" for complete usage\ninstructions and worked examples. Enable in consuming packages via:\n@ghc-options: -fplugin=Polytropos.Plugin@.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghc-tcplugin-api" or (errorHandler.buildDepError "ghc-tcplugin-api"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-plugin-smoke" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          ];
          buildable = true;
        };
      };
    };
  }