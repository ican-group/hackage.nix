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
      specVersion = "1.10";
      identifier = { name = "emojis"; version = "0.1.6"; };
      license = "BSD-3-Clause";
      copyright = "2019 John MacFarlane";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane";
      homepage = "https://github.com/jgm/emojis#readme";
      url = "";
      synopsis = "Conversion between emoji characters and their names.";
      description = "This package provides functions for converting\nemoji names to emoji characters and vice versa.\n\nHow does it differ from the @emoji@ package?\n\n-   It supports a fuller range of emojis, including all those\nsupported by GitHub\n-   It supports lookup of emoji aliases from emoji\n-   It uses Text rather than String\n-   It has a lighter dependency footprint: in particular, it\ndoes not require aeson\n-   It does not require TemplateHaskell";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ];
        buildable = true;
      };
      tests = {
        "emojis-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."emojis" or (errorHandler.buildDepError "emojis"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
          ];
          buildable = true;
        };
      };
    };
  }