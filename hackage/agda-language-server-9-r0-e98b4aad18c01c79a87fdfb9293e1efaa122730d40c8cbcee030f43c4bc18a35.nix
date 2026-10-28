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
      agda-2-6-4 = false;
      agda-2-7-0 = false;
      agda-2-8-0 = false;
      reactor = false;
    };
    package = {
      specVersion = "1.12";
      identifier = { name = "agda-language-server"; version = "9"; };
      license = "MIT";
      copyright = "2020-23 Ting-Gian LUA, Andreas ABEL";
      maintainer = "banacorn@gmail.com, Andreas Abel";
      author = "Ting-Gian LUA";
      homepage = "https://github.com/agda/agda-language-server#readme";
      url = "";
      synopsis = "An implementation of language server protocal (LSP) for Agda 2.";
      description = "Please see the README on GitHub at <https://github.com/agda/agda-language-server#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
          (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optional (flags.agda-2-6-4) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ pkgs.lib.optional (flags.agda-2-7-0) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ pkgs.lib.optional (flags.agda-2-8-0) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ (if system.isWasm32
          then [ (hsPkgs."unix" or (errorHandler.buildDepError "unix")) ]
          else [
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."network-simple" or (errorHandler.buildDepError "network-simple"))
          ]);
        buildable = true;
      };
      exes = {
        "als" = {
          depends = (((([
            (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."agda-language-server" or (errorHandler.buildDepError "agda-language-server"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ] ++ pkgs.lib.optional (flags.agda-2-6-4) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ pkgs.lib.optional (flags.agda-2-7-0) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ pkgs.lib.optional (flags.agda-2-8-0) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ (if system.isWasm32
            then [ (hsPkgs."unix" or (errorHandler.buildDepError "unix")) ]
            else [
              (hsPkgs."network" or (errorHandler.buildDepError "network"))
              (hsPkgs."network-simple" or (errorHandler.buildDepError "network-simple"))
            ])) ++ pkgs.lib.optionals (flags.reactor) [
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."ghc-experimental" or (errorHandler.buildDepError "ghc-experimental"))
          ];
          buildable = true;
        };
      };
      tests = {
        "als-test" = {
          depends = ((([
            (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."lsp" or (errorHandler.buildDepError "lsp"))
            (hsPkgs."lsp-test" or (errorHandler.buildDepError "lsp-test"))
            (hsPkgs."lsp-types" or (errorHandler.buildDepError "lsp-types"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ] ++ pkgs.lib.optional (flags.agda-2-6-4) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ pkgs.lib.optional (flags.agda-2-7-0) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ pkgs.lib.optional (flags.agda-2-8-0) (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))) ++ (if system.isWasm32
            then [ (hsPkgs."unix" or (errorHandler.buildDepError "unix")) ]
            else [
              (hsPkgs."network" or (errorHandler.buildDepError "network"))
              (hsPkgs."network-simple" or (errorHandler.buildDepError "network-simple"))
            ]);
          buildable = true;
        };
      };
    };
  }