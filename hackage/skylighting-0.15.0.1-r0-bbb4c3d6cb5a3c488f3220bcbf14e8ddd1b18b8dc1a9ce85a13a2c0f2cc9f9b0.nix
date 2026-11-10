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
    flags = { executable = false; };
    package = {
      specVersion = "1.22";
      identifier = { name = "skylighting"; version = "0.15.0.1"; };
      license = "GPL-2.0-only";
      copyright = "(C) 2016-2024 John MacFarlane";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane";
      homepage = "https://github.com/jgm/skylighting";
      url = "";
      synopsis = "syntax highlighting library";
      description = "Skylighting is a syntax highlighting library with\nsupport for over one hundred languages.  It derives\nits tokenizers from XML syntax definitions used\nby KDE's KSyntaxHighlighting framework, so any\nsyntax supported by that framework can be added.\nAn optional command-line program is provided.\nSkylighting is intended to be the successor to\nhighlighting-kate.\nThis package provides generated syntax modules\nbased on the KDE XML definitions provided by the\n@skylighting-core@ package. As a result this\npackage is licensed under the GPL.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."skylighting-core" or (errorHandler.buildDepError "skylighting-core"))
          (hsPkgs."skylighting-format-ansi" or (errorHandler.buildDepError "skylighting-format-ansi"))
          (hsPkgs."skylighting-format-context" or (errorHandler.buildDepError "skylighting-format-context"))
          (hsPkgs."skylighting-format-latex" or (errorHandler.buildDepError "skylighting-format-latex"))
          (hsPkgs."skylighting-format-blaze-html" or (errorHandler.buildDepError "skylighting-format-blaze-html"))
          (hsPkgs."skylighting-format-typst" or (errorHandler.buildDepError "skylighting-format-typst"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
        ];
        buildable = true;
      };
      exes = {
        "skylighting" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."pretty-show" or (errorHandler.buildDepError "pretty-show"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."blaze-html" or (errorHandler.buildDepError "blaze-html"))
            (hsPkgs."skylighting" or (errorHandler.buildDepError "skylighting"))
          ];
          buildable = if flags.executable then true else false;
        };
      };
    };
  }