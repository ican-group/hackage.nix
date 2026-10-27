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
      specVersion = "3.4";
      identifier = { name = "tramaj-hs"; version = "0.5.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "lucas.dicioccio@gmail.com";
      author = "Lucas DiCioccio";
      homepage = "https://github.com/lucasdicioccio/templating-lang";
      url = "";
      synopsis = "Haskell parser/AST/evaluator for the tramaj language";
      description = "Parser, AST and evaluator for the tramaj language specified in\n@specs\\/reference.md@ at the root of this repository -- a small\nHAML-like template language with a bindings prelude, closures, and\n@map@\\/@filter@\\/@scan@, designed to be written by humans and LLMs and\nrendered against a JSON context.\n.\nThis is an independent Haskell port of the PureScript implementation\nunder @..\\/tramaj@, built on megaparsec + aeson rather than shared\nvia FFI, so a host can evaluate a template server-side and not only in\nthe browser. Both implementations target the same grammar and are kept\nin agreement by hand-ported test fixtures; see the repository README for\nthe caveats that come with that.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "unit" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
            (hsPkgs."tramaj-hs" or (errorHandler.buildDepError "tramaj-hs"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }