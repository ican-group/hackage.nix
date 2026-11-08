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
      identifier = { name = "copilot-visualizer"; version = "4.8.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ivan Perez <ivan.perezdominguez@nasa.gov>";
      author = "Ivan Perez, Frank Dedden, Ryan Scott, Kyle Beechly";
      homepage = "https://copilot-language.github.io";
      url = "";
      synopsis = "Visualizer for Copilot.";
      description = "Visualizer for Copilot.\n\nCopilot is a stream (i.e., infinite lists) domain-specific language (DSL) in\nHaskell that compiles into embedded C. Copilot contains an interpreter,\nmultiple back-end compilers, and other verification tools.\n\nA tutorial, examples, and other information are available at\n<https://copilot-language.github.io>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hint" or (errorHandler.buildDepError "hint"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."ogma-extra" or (errorHandler.buildDepError "ogma-extra"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
          (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
          (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
          (hsPkgs."copilot-interpreter" or (errorHandler.buildDepError "copilot-interpreter"))
          (hsPkgs."copilot-language" or (errorHandler.buildDepError "copilot-language"))
        ];
        buildable = true;
      };
      exes = {
        "gui-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot-visualizer" or (errorHandler.buildDepError "copilot-visualizer"))
          ];
          buildable = if flags.examples then true else false;
        };
        "tikz-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."copilot" or (errorHandler.buildDepError "copilot"))
            (hsPkgs."copilot-visualizer" or (errorHandler.buildDepError "copilot-visualizer"))
          ];
          buildable = if flags.examples then true else false;
        };
      };
    };
  }