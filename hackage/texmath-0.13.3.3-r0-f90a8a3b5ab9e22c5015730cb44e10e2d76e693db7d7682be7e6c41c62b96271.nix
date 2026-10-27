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
    flags = { executable = false; server = false; };
    package = {
      specVersion = "2.0";
      identifier = { name = "texmath"; version = "0.13.3.3"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane, Matthew Pickering";
      homepage = "http://github.com/jgm/texmath";
      url = "";
      synopsis = "Conversion between math formats.";
      description = "The texmath library provides functions to read\nand write TeX math, presentation MathML, and OMML (Office Math\nMarkup Language, used in Microsoft Office). Support is also\nincluded for converting math formats to Gnu eqn, typst,\nStarMath, and pandoc's native format (allowing conversion, via\npandoc, to a variety of different markup formats). The TeX\nreader supports basic LaTeX and AMS extensions, and it can\nparse and apply LaTeX macros. (See\n<https://johnmacfarlane.net/texmath here> for a live demo of\nbidirectional conversion between LaTeX and MathML.)\n\nThe package also includes several utility modules which may be\nuseful for anyone looking to manipulate either TeX math or\nMathML.  For example, a copy of the MathML operator dictionary is\nincluded.\n\nUse the @executable@ flag to install a standalone\nexecutable, @texmath@, that converts formulas from one\nformat to another. (Use the @--help@ flag for a description of all\nfunctionality).\n\nUse the @server@ flag to install a web server, @texmath-server@,\nthat exposes a JSON API allowing conversion of individual\nformulas and batches of formulas.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."typst-symbols" or (errorHandler.buildDepError "typst-symbols"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
        ];
        buildable = true;
      };
      exes = {
        "texmath" = {
          depends = pkgs.lib.optionals (flags.executable) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."texmath" or (errorHandler.buildDepError "texmath"))
            (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
            (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."pretty-show" or (errorHandler.buildDepError "pretty-show"))
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          ];
          buildable = if flags.executable then true else false;
        };
        "texmath-server" = {
          depends = pkgs.lib.optionals (flags.server) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."texmath" or (errorHandler.buildDepError "texmath"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
            (hsPkgs."servant-server" or (errorHandler.buildDepError "servant-server"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-logger" or (errorHandler.buildDepError "wai-logger"))
            (hsPkgs."wai-extra" or (errorHandler.buildDepError "wai-extra"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          ];
          buildable = if flags.server then true else false;
        };
      };
      tests = {
        "test-texmath" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."texmath" or (errorHandler.buildDepError "texmath"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."pretty-show" or (errorHandler.buildDepError "pretty-show"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          ];
          buildable = true;
        };
      };
    };
  }