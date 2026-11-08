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
      identifier = { name = "copilot-prettyprinter"; version = "4.8.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ivan Perez <ivan.perezdominguez@nasa.gov>";
      author = "Frank Dedden, Lee Pike, Robin Morisset, Alwyn Goodloe,\nSebastian Niller, Nis Nordbyop Wegmann, Ivan Perez";
      homepage = "https://copilot-language.github.io";
      url = "";
      synopsis = "A prettyprinter of Copilot Specifications.";
      description = "A prettyprinter of Copilot specifications.\n\nCopilot is a stream (i.e., infinite lists) domain-specific language (DSL) in\nHaskell that compiles into embedded C.  Copilot contains an interpreter,\nmultiple back-end compilers, and other verification tools.\n\nA tutorial, examples, and other information are available at\n<https://copilot-language.github.io>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
        ];
        buildable = true;
      };
    };
  }