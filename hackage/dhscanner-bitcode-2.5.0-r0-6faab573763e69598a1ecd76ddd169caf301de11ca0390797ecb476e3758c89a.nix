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
      specVersion = "3.12";
      identifier = { name = "dhscanner-bitcode"; version = "2.5.0"; };
      license = "GPL-3.0-only";
      copyright = "(c) 2024 Oren Ish Shalom";
      maintainer = "Oren Ish Shalom";
      author = "OrenGitHub";
      homepage = "https://github.com/OrenGitHub/dhscanner";
      url = "";
      synopsis = "Intermediate language for static code analysis";
      description = "The [intermediate language \\/ intermediate representation \\/ bitcode](https://en.wikipedia.org/wiki/Intermediate_representation#Intermediate_language)\n(IL \\/ IR \\/ bitcode) is a data structure able to represent code originating from /multiple/\nprogramming languages. Its main purpose is to enable an efficient and uniform /static code analysis/,\nas part of the [dhscanner](https://github.com/OrenGitHub/dhscanner) framework\nfor [CI/CD](https://en.wikipedia.org/wiki/CI/CD) container security checks.\nAs part of that framework, it targets mostly languages used for /cloud native applications/:\n__Python__, __Ruby__, __Php__, __Javascript__, __Typescript__, __Java__, __C#__ and __Golang__.\nTypically, a collection of files are first parsed using relevant\n[parsers](https://github.com/OrenGitHub/dhscanner.1.parsers), then,\nthe resulting collection of abstract syntax trees is sent to code generation,\nwhere it is translated into a collection of /callables/.\nA callable is a sequence of commands corresponding to either a function, a method\nor (in languages like python) a script. The design of commands was done with simplicity\nin mind. The commands resemble an abstract RISC-style assembley, motivated by keeping\nlater-phases analyses as simple as possible.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."dhscanner-ast" or (errorHandler.buildDepError "dhscanner-ast"))
        ];
        buildable = true;
      };
      tests = {
        "dhscanner-bitcode-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."dhscanner-ast" or (errorHandler.buildDepError "dhscanner-ast"))
            (hsPkgs."dhscanner-bitcode" or (errorHandler.buildDepError "dhscanner-bitcode"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
          ];
          buildable = true;
        };
      };
    };
  }