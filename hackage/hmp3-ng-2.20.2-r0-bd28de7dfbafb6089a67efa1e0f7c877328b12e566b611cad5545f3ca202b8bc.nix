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
      identifier = { name = "hmp3-ng"; version = "2.20.2"; };
      license = "GPL-2.0-or-later";
      copyright = "";
      maintainer = "Galen Huntington";
      author = "Don Stewart, Galen Huntington";
      homepage = "https://github.com/galenhuntington/hmp3-ng#readme";
      url = "";
      synopsis = "A TUI mp3 player written in Haskell";
      description = "An mp3 player with a curses frontend.  Playlists are populated by\npassing file and directory names on the command line.  'h' displays\nhelp.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hscurses" or (errorHandler.buildDepError "hscurses"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."posix-paths" or (errorHandler.buildDepError "posix-paths"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
        ];
        pkgconfig = [
          (pkgconfPkgs."ncursesw" or (errorHandler.pkgConfDepError "ncursesw"))
        ];
        buildable = true;
      };
      exes = {
        "hmp3" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hmp3-ng" or (errorHandler.buildDepError "hmp3-ng"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."hmp3-ng" or (errorHandler.buildDepError "hmp3-ng"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          ];
          buildable = true;
        };
      };
    };
  }