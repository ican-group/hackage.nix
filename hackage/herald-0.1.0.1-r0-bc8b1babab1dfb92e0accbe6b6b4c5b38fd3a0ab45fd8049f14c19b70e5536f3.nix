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
      identifier = { name = "herald"; version = "0.1.0.1"; };
      license = "AGPL-3.0-or-later";
      copyright = "";
      maintainer = "joaquin@joaquinrossi.net";
      author = "Joaquín Rossi";
      homepage = "https://github.com/joaquin-rossi/herald";
      url = "";
      synopsis = "Write sheet music as Haskell code and synthesize it";
      description = "Herald synthesizes music from scores written as Haskell code, with named\npitches, key signatures, checked bars, ties, dynamics and several voices.\nVoices are performed by simple instruments (pure tones, additive, organ\nand a Karplus-Strong harpsichord) in equal temperament or historical\ntunings, and rendered to mono or stereo WAV or played through ffplay.\nStart with the \"Herald\" module, which re-exports the whole library.";
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