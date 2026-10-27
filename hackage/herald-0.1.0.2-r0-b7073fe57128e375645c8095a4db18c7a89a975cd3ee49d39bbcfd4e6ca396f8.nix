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
      identifier = { name = "herald"; version = "0.1.0.2"; };
      license = "AGPL-3.0-or-later";
      copyright = "";
      maintainer = "joaquin@joaquinrossi.net";
      author = "Joaquín Rossi";
      homepage = "https://github.com/joaquin-rossi/herald";
      url = "";
      synopsis = "Sheet music in Haskell";
      description = "Haskell library for writing musical scores as code and synthesizing them\ninto audio.\n\nFeatures:\n\n* Named pitches, key signatures and accidentals that last until the bar line\n* Note values, dots, ties, chords and trills\n* Time signatures, with every bar checked\n* Dynamics\n* Equal temperament and historical tunings\n* Several voices, each with its own instrument and stereo position\n* Mono or stereo WAV output and playback\n\nInstruments: @pureTone@, @additive@, @organ@, @harpsichord@.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "herald-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."herald" or (errorHandler.buildDepError "herald"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }