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
    flags = { examples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "copilot"; version = "4.8.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ivan Perez <ivan.perezdominguez@nasa.gov>";
      author = "Frank Dedden, Nis Nordby Wegmann, Lee Pike, Robin Morisset, Sebastian Niller, Alwyn Goodloe, Ivan Perez";
      homepage = "https://copilot-language.github.io";
      url = "";
      synopsis = "A stream DSL for writing embedded C programs.";
      description = "Copilot is a stream-based runtime verification framework implemented as an\nembedded domain-specific language (EDSL) in Haskell. Programs can be\ninterpreted for testing, or translated into C99 code to be incorporated in a\nproject, or as a standalone application. The C99 backend output is constant\nin memory and time, making it suitable for systems with hard realtime\nrequirements.\n\nThis package is the main entry-point for using Copilot.\n\nA tutorial, examples, and other information are available at\n<https://copilot-language.github.io>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
          (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          (hsPkgs."copilot-language" or (errorHandler.buildDepError "copilot-language"))
          (hsPkgs."copilot-libraries" or (errorHandler.buildDepError "copilot-libraries"))
          (hsPkgs."copilot-c99" or (errorHandler.buildDepError "copilot-c99"))
          (hsPkgs."copilot-prettyprinter" or (errorHandler.buildDepError "copilot-prettyprinter"))
        ];
        buildable = true;
      };
      exes = {
        "what4-propositional" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = if flags.examples then true else false;
        };
        "what4-arithmetic" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = if flags.examples then true else false;
        };
        "what4-arithmetic-counterexamples" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = if flags.examples then true else false;
        };
        "what4-structs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = if flags.examples then true else false;
        };
        "wcv" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = if flags.examples then true else false;
        };
        "addmult" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = if flags.examples then true else false;
        };
        "array" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
          ];
          buildable = if flags.examples then true else false;
        };
        "cast" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
          ];
          buildable = if flags.examples then true else false;
        };
        "clock" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-libraries" or (errorHandler.buildDepError "copilot-libraries"))
            (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
            (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          ];
          buildable = if flags.examples then true else false;
        };
        "counter" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-c99" or (errorHandler.buildDepError "copilot-c99"))
          ];
          buildable = if flags.examples then true else false;
        };
        "engine" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
          ];
          buildable = if flags.examples then true else false;
        };
        "heater" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-c99" or (errorHandler.buildDepError "copilot-c99"))
          ];
          buildable = if flags.examples then true else false;
        };
        "structs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-c99" or (errorHandler.buildDepError "copilot-c99"))
          ];
          buildable = if flags.examples then true else false;
        };
        "structs-update-field" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-c99" or (errorHandler.buildDepError "copilot-c99"))
          ];
          buildable = if flags.examples then true else false;
        };
        "voting" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
          ];
          buildable = if flags.examples then true else false;
        };
      };
    };
  }