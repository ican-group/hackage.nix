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
      identifier = { name = "dhscanner-kbgen"; version = "2.3.0"; };
      license = "GPL-3.0-only";
      copyright = "(c) 2025 Oren Ish Shalom";
      maintainer = "Oren Ish Shalom";
      author = "OrenGitHub";
      homepage = "https://github.com/OrenGitHub/dhscanner";
      url = "";
      synopsis = "knowledge base predicates for static code analysis";
      description = "* The [knowledge base](https://en.wikipedia.org/wiki/Knowledge_representation_and_reasoning) ( kb )\n  aims to be a data structure able to:\n\n    * represent /multiple/ facts about the source code repo\n    * from /various/ programming languages\n    * each fact can be translated to a [Prolog](https://en.wikipedia.org/wiki/Prolog) fact\n    * facts can be combined to create [predicates](https://en.wikipedia.org/wiki/Predicate_%28logic%29)\n    * predictaes can be combined to formulate /security queries/\n\n* [Prolog](https://en.wikipedia.org/wiki/Prolog) facts describe relations between:\n\n    * code locations\n    * const strings\n    * const integers\n\n* [Prolog](https://en.wikipedia.org/wiki/Prolog) facts can be /combined/:\n\n    * create /expressive/ queries from /simple/ facts\n    * [conjunction](https://en.wikipedia.org/wiki/Logical_conjunction)\n    * [disjunction](https://en.wikipedia.org/wiki/Logical_disjunction)\n    * [negation](https://en.wikipedia.org/wiki/Negation)\n\n* [Prolog](https://en.wikipedia.org/wiki/Prolog) queries are /easy/ to write:\n\n    * you /don't/ have to be a Prolog expert\n    * copy-paste the basic facts to /any/ [LLM](https://en.wikipedia.org/wiki/Large_language_model)\n    * explain in plain English your query's purpose\n    * et voilà !";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."dhscanner-ast" or (errorHandler.buildDepError "dhscanner-ast"))
          (hsPkgs."dhscanner-bitcode" or (errorHandler.buildDepError "dhscanner-bitcode"))
        ];
        buildable = true;
      };
      tests = {
        "restoreloc" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."dhscanner-kbgen" or (errorHandler.buildDepError "dhscanner-kbgen"))
            (hsPkgs."dhscanner-ast" or (errorHandler.buildDepError "dhscanner-ast"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
          buildable = true;
        };
      };
    };
  }