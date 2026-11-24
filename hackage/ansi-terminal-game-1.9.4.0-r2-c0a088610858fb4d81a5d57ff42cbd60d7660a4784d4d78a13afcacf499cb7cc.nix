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
      identifier = { name = "ansi-terminal-game"; version = "1.9.4.0"; };
      license = "GPL-3.0-only";
      copyright = "© 2017-2023 Francesco Ariis et al.";
      maintainer = "fa-ml@ariis.it";
      author = "Francesco Ariis et al. (see AUTHORS)";
      homepage = "http://www.ariis.it/static/articles/libraries/page.html#ansi-terminal-game";
      url = "";
      synopsis = "cross-platform library for terminal games";
      description = "Library which aims to replicate standard 2d game\nfunctions (blit, ticks, timers, etc.) in a terminal\nsetting; features double buffering to optimise\nperformance.\nAims to be cross compatible (based on \"ansi-terminal\",\nno unix-only dependencies), practical.\nSee @examples@ folder for some minimal programs.  A\nfull game: <http://www.ariis.it/static/articles/venzone/page.html venzone>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
          (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."linebreak" or (errorHandler.buildDepError "linebreak"))
          (hsPkgs."mintty" or (errorHandler.buildDepError "mintty"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."terminal-size" or (errorHandler.buildDepError "terminal-size"))
          (hsPkgs."unidecode" or (errorHandler.buildDepError "unidecode"))
          (hsPkgs."timers-tick" or (errorHandler.buildDepError "timers-tick"))
          (hsPkgs."colour" or (errorHandler.buildDepError "colour"))
        ];
        buildable = true;
      };
      exes = {
        "alone" = {
          depends = pkgs.lib.optionals (flags.examples) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ansi-terminal-game" or (errorHandler.buildDepError "ansi-terminal-game"))
          ];
          buildable = if flags.examples then true else false;
        };
        "alone-playback" = {
          depends = pkgs.lib.optionals (flags.examples) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ansi-terminal-game" or (errorHandler.buildDepError "ansi-terminal-game"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ];
          buildable = if flags.examples then true else false;
        };
        "balls" = {
          depends = pkgs.lib.optionals (flags.examples) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ansi-terminal-game" or (errorHandler.buildDepError "ansi-terminal-game"))
          ];
          buildable = if flags.examples then true else false;
        };
        "hot-reload" = {
          depends = pkgs.lib.optionals (flags.examples) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ansi-terminal-game" or (errorHandler.buildDepError "ansi-terminal-game"))
          ];
          buildable = if flags.examples then true else false;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
            (hsPkgs."linebreak" or (errorHandler.buildDepError "linebreak"))
            (hsPkgs."mintty" or (errorHandler.buildDepError "mintty"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."terminal-size" or (errorHandler.buildDepError "terminal-size"))
            (hsPkgs."unidecode" or (errorHandler.buildDepError "unidecode"))
            (hsPkgs."timers-tick" or (errorHandler.buildDepError "timers-tick"))
            (hsPkgs."colour" or (errorHandler.buildDepError "colour"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }