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
    flags = { doctest = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "filepather"; version = "0.8.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2021-2026 Tony Morris";
      maintainer = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      author = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      homepage = "https://gitlab.com/tonymorris/document-build";
      url = "";
      synopsis = "Computations that depend on a file path, and tracked build steps";
      description = "<<https://logo.systemf.com.au/systemf-450x450.png>>\n\n@FilePather f a@ is a computation that depends on the file path being\noperated on:\n\n> newtype FilePather f a = FilePather (FilePath -> f a)\n\nIt is isomorphic to @ReaderT FilePath f a@, with the same instances, and\ncombinators to run one @FilePather@ on the output of another, and to apply\nrules to every file in a directory.\n\n@Tracked f a@ is a named build step, or several, that records the files it\nmakes, with the steps that made them, so that a chain of build steps that\nwould go round in a cycle is stopped before it does:\n\n> newtype Tracked f a = Tracked (FilePather (ReaderT Trail (ExceptT Cycle f)) (Outputs, a))";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."adjunctions" or (errorHandler.buildDepError "adjunctions"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
          (hsPkgs."exitcode" or (errorHandler.buildDepError "exitcode"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."selective" or (errorHandler.buildDepError "selective"))
          (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."witherable" or (errorHandler.buildDepError "witherable"))
        ];
        buildable = true;
      };
      tests = {
        "hedgehog" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."adjunctions" or (errorHandler.buildDepError "adjunctions"))
            (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
            (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
            (hsPkgs."filepather" or (errorHandler.buildDepError "filepather"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."hedgehog-fn" or (errorHandler.buildDepError "hedgehog-fn"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."selective" or (errorHandler.buildDepError "selective"))
            (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."witherable" or (errorHandler.buildDepError "witherable"))
          ];
          buildable = true;
        };
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."filepather" or (errorHandler.buildDepError "filepather"))
          ];
          buildable = if !flags.doctest then false else true;
        };
      };
    };
  }