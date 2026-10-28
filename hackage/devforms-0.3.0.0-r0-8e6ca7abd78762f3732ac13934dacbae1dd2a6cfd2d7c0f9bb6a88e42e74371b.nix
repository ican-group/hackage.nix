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
      identifier = { name = "devforms"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Lassi Haasio";
      maintainer = "ilikeavocadoes@devmail.cc";
      author = "Lassi Haasio";
      homepage = "";
      url = "";
      synopsis = "A builder DSL for HTML survey forms with built-in server and storage";
      description = "devforms is a Haskell library for building HTML survey forms using a\nmonadic builder DSL. It bundles a Scotty web server with htmx and\n_hyperscript for client-side interactivity, Lucid2 for HTML rendering,\nand Pico CSS for styling. Submissions are stored as JSONL files.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."relude" or (errorHandler.buildDepError "relude"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."scotty" or (errorHandler.buildDepError "scotty"))
          (hsPkgs."lucid2" or (errorHandler.buildDepError "lucid2"))
          (hsPkgs."htmx-lucid" or (errorHandler.buildDepError "htmx-lucid"))
          (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."string-interpolate" or (errorHandler.buildDepError "string-interpolate"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."regex-base" or (errorHandler.buildDepError "regex-base"))
          (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
        ];
        buildable = true;
      };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."devforms" or (errorHandler.buildDepError "devforms"))
            (hsPkgs."relude" or (errorHandler.buildDepError "relude"))
          ];
          buildable = true;
        };
      };
    };
  }