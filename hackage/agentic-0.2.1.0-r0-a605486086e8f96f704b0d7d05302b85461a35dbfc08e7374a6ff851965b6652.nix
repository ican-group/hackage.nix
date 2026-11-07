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
      identifier = { name = "agentic"; version = "0.2.1.0"; };
      license = "BSD-2-Clause";
      copyright = "2026 Tom Wells";
      maintainer = "drshade@gmail.com";
      author = "Tom Wells";
      homepage = "https://github.com/drshade/haskell-agentic";
      url = "";
      synopsis = "Composable, inspectable agentic workflows mixing LLMs and Jev";
      description = "Typed agentic workflows built from Arrow combinators. A flow is a description: you can describe it as a tree, Mermaid or Graphviz before running anything, then interpret it against System One (Jev) and System Two (an LLM) providers. This is the core: flows, contracts, questions, the runtime and the interpreter. It depends only on base and text.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "agentic-test" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "agentic-portable-test" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "agentic-projection-test" = {
          depends = [
            (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }