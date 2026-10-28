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
      identifier = { name = "document-build"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2021-2026 Tony Morris";
      maintainer = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      author = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      homepage = "https://gitlab.com/tonymorris/document-build";
      url = "";
      synopsis = "Build documents with Haskell";
      description = "<<https://logo.systemf.com.au/systemf-450x450.png>>\n\nBuild documents with Haskell: convert them between formats, get information\nabout them, and replace strings in them.\n\n== Operations\n\n@Document.Build.Operations@ provides the canonical document operations,\nevery one a @FilePather@ value (from the @filepather@ package) in an effect\nthat fails with an exit code (from the @exitcode@ package): convert\nLibreOffice, markdown, PDF and image files; count pages; split and join PDF\nfiles; hash files; get git details of files; and replace strings in files.\n\n== Rules and builds\n\n@Document.Build.Rules@ wraps the operations in named, tracked build steps,\nwhich say which files are made from which, each with its settings as\narguments, and @Document.Build.Documents@ runs rules over a project until\nthey make no more files.\n\nThe library has no settings of its own: the build file of a project, a\ncabal script, gives @build@ the directories of the project and its rules.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."exitcode" or (errorHandler.buildDepError "exitcode"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."filepather" or (errorHandler.buildDepError "filepather"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."natural" or (errorHandler.buildDepError "natural"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
      exes = {
        "document-build" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."document-build" or (errorHandler.buildDepError "document-build"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
          buildable = true;
        };
      };
      tests = {
        "hedgehog" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."document-build" or (errorHandler.buildDepError "document-build"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."hedgehog-fn" or (errorHandler.buildDepError "hedgehog-fn"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."document-build" or (errorHandler.buildDepError "document-build"))
          ];
          buildable = if !flags.doctest then false else true;
        };
      };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."filepather" or (errorHandler.buildDepError "filepather"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."document-build" or (errorHandler.buildDepError "document-build"))
          ];
          buildable = true;
        };
      };
    };
  }