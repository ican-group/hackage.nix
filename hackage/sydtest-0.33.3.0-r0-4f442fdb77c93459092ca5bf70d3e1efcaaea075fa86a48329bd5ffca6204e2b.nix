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
      specVersion = "1.12";
      identifier = { name = "sydtest"; version = "0.33.3.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2020-2024 Tom Sydney Kerckhove";
      maintainer = "syd@cs-syd.eu";
      author = "Tom Sydney Kerckhove";
      homepage = "https://github.com/NorfairKing/sydtest#readme";
      url = "";
      synopsis = "A modern testing framework for Haskell with good defaults and advanced testing features.";
      description = "A modern testing framework for Haskell with good defaults and advanced testing features. Sydtest aims to make the common easy and the hard possible. See https://github.com/NorfairKing/sydtest#readme for more information.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."MonadRandom" or (errorHandler.buildDepError "MonadRandom"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."autodocodec" or (errorHandler.buildDepError "autodocodec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."fast-myers-diff" or (errorHandler.buildDepError "fast-myers-diff"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."opt-env-conf" or (errorHandler.buildDepError "opt-env-conf"))
          (hsPkgs."path" or (errorHandler.buildDepError "path"))
          (hsPkgs."path-io" or (errorHandler.buildDepError "path-io"))
          (hsPkgs."pretty-show" or (errorHandler.buildDepError "pretty-show"))
          (hsPkgs."quickcheck-io" or (errorHandler.buildDepError "quickcheck-io"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."random-shuffle" or (errorHandler.buildDepError "random-shuffle"))
          (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          (hsPkgs."safe-coloured-text" or (errorHandler.buildDepError "safe-coloured-text"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."svg-builder" or (errorHandler.buildDepError "svg-builder"))
          (hsPkgs."sydtest-mutation-runtime" or (errorHandler.buildDepError "sydtest-mutation-runtime"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ] ++ (if system.isWindows
          then [
            (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          ]
          else [
            (hsPkgs."safe-coloured-text-terminfo" or (errorHandler.buildDepError "safe-coloured-text-terminfo"))
          ]);
        buildable = true;
      };
    };
  }