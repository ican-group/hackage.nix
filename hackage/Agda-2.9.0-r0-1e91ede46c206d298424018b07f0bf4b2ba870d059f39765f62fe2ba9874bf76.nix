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
      dump-core = false;
      debug = false;
      debug-serialisation = false;
      debug-parsing = false;
      enable-cluster-counting = false;
      optimise-heavily = true;
      use-xdg-data-home = false;
      version-with-git-hash = false;
      ignore-build-tool-depends = false;
    };
    package = {
      specVersion = "2.4";
      identifier = { name = "Agda"; version = "2.9.0"; };
      license = "MIT";
      copyright = "(c) 2005-2026 The Agda Team.";
      maintainer = "The Agda Team";
      author = "The Agda Team, see https://agda.readthedocs.io/en/latest/team.html";
      homepage = "https://wiki.portal.chalmers.se/agda/";
      url = "";
      synopsis = "A dependently typed functional programming language and proof assistant";
      description = "Agda is a dependently typed functional programming language: It has\ninductive families, which are similar to Haskell's GADTs, but they\ncan be indexed by values and not just types. It also has\nparameterised modules, mixfix operators, Unicode characters, and an\ninteractive Emacs interface (the type checker can assist in the\ndevelopment of your code).\n\nAgda is also a proof assistant: It is an interactive system for\nwriting and checking proofs. Agda is based on intuitionistic type\ntheory, a foundational system for constructive mathematics developed\nby the Swedish logician Per Martin-L&#xf6;f. It has many\nsimilarities with other proof assistants based on dependent types,\nsuch as Rocq (formerly known as Coq), Idris, Lean and NuPRL.\n\nThis package includes both a command-line program (agda) and an\nEmacs mode.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."blaze-html" or (errorHandler.buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (errorHandler.buildDepError "blaze-markup"))
          (hsPkgs."boxes" or (errorHandler.buildDepError "boxes"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-hash" or (errorHandler.buildDepError "data-hash"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."edit-distance" or (errorHandler.buildDepError "edit-distance"))
          (hsPkgs."enummapset" or (errorHandler.buildDepError "enummapset"))
          (hsPkgs."equivalence" or (errorHandler.buildDepError "equivalence"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."filemanip" or (errorHandler.buildDepError "filemanip"))
          (hsPkgs."generic-data" or (errorHandler.buildDepError "generic-data"))
          (hsPkgs."ghc-bignum" or (errorHandler.buildDepError "ghc-bignum"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."haskeline" or (errorHandler.buildDepError "haskeline"))
          (hsPkgs."infinite-list" or (errorHandler.buildDepError "infinite-list"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."murmur-hash" or (errorHandler.buildDepError "murmur-hash"))
          (hsPkgs."nonempty-containers" or (errorHandler.buildDepError "nonempty-containers"))
          (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
          (hsPkgs."peano" or (errorHandler.buildDepError "peano"))
          (hsPkgs."pqueue" or (errorHandler.buildDepError "pqueue"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."process-extras" or (errorHandler.buildDepError "process-extras"))
          (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uri-encode" or (errorHandler.buildDepError "uri-encode"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."vector-hashtables" or (errorHandler.buildDepError "vector-hashtables"))
          (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))
        ] ++ pkgs.lib.optional (flags.enable-cluster-counting) (hsPkgs."text-icu" or (errorHandler.buildDepError "text-icu"))) ++ pkgs.lib.optional (flags.version-with-git-hash) (hsPkgs."gitrev" or (errorHandler.buildDepError "gitrev"))) ++ pkgs.lib.optional (system.isWindows) (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))) ++ pkgs.lib.optional (!system.isWasm32) (hsPkgs."filelock" or (errorHandler.buildDepError "filelock"));
        build-tools = pkgs.lib.optionals (!flags.ignore-build-tool-depends) [
          (hsPkgs.pkgsBuildBuild.alex.components.exes.alex or (pkgs.pkgsBuildBuild.alex or (errorHandler.buildToolDepError "alex:alex")))
          (hsPkgs.pkgsBuildBuild.happy.components.exes.happy or (pkgs.pkgsBuildBuild.happy or (errorHandler.buildToolDepError "happy:happy")))
        ];
        buildable = true;
      };
      exes = {
        "agda" = {
          depends = [
            (hsPkgs."Agda" or (errorHandler.buildDepError "Agda"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
          buildable = true;
        };
        "agda-mode" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ] ++ pkgs.lib.optional (flags.version-with-git-hash) (hsPkgs."gitrev" or (errorHandler.buildDepError "gitrev"))) ++ pkgs.lib.optional (!system.isWasm32) (hsPkgs."filelock" or (errorHandler.buildDepError "filelock"));
          buildable = true;
        };
      };
    };
  }