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
    flags = { doctest = false; examples = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "casa-reoc"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2026 System F Aerial Operations Pty Ltd";
      maintainer = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      author = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      homepage = "https://gitlab.com/system-f/code/casa-reoc";
      url = "";
      synopsis = "The documents of a CASA ReOC application, as Haskell data types";
      description = "<<https://logo.systemf.com.au/systemf-450x450.png>>\n\nThe variables of an application to CASA for the initial issue of a\nremotely piloted aircraft operator's certificate (ReOC), of its RPAS\noperations manual and of its RePL training manual, as data types with\nclassy optics. A value of @ReOC@ gives a filled CASA Form 101-02 (XFDF), a\ncomplete operations manual and, with RePL training, a RePL training manual\n(Flat ODF text).\n\n== Data types\n\nEvery data type is in its own module under @ReOC.Data@, and every name of a\nfield or constructor in its own module under @ReOC.Name@, following the\nclassy optics recipe. Values that have an invariant (an ABN, a phone\nnumber, text that is not blank) are primitive types under\n@ReOC.Primitive@, built with a prism or a literal checked at compile time.\n\n== Documents\n\n@ReOC.Render.ApplicationForm@ gives the XFDF of CASA Form 101-02,\n@ReOC.Render.OperationsManual@ the operations manual and\n@ReOC.Render.TrainingManual@ the RePL training manual. @ReOC.Render.Write@\nwrites them into a directory. The internal library @examples@ holds the\napplications of four made-up operators.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."validation" or (errorHandler.buildDepError "validation"))
        ];
        buildable = true;
      };
      sublibs = {
        "examples" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."casa-reoc" or (errorHandler.buildDepError "casa-reoc"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
      };
      exes = {
        "reoc-examples" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."casa-reoc".components.sublibs.examples or (errorHandler.buildDepError "casa-reoc:examples"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."casa-reoc" or (errorHandler.buildDepError "casa-reoc"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.examples then false else true;
        };
      };
      tests = {
        "hedgehog" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."casa-reoc".components.sublibs.examples or (errorHandler.buildDepError "casa-reoc:examples"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."casa-reoc" or (errorHandler.buildDepError "casa-reoc"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
          ];
          buildable = true;
        };
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."casa-reoc" or (errorHandler.buildDepError "casa-reoc"))
          ];
          buildable = if !flags.doctest then false else true;
        };
      };
    };
  }