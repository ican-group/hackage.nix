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
      specVersion = "2.0";
      identifier = { name = "ogma-core"; version = "1.17.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "ivan.perezdominguez@nasa.gov";
      author = "Ivan Perez, Alwyn Goodloe";
      homepage = "https://github.com/nasa/ogma";
      url = "";
      synopsis = "Ogma: Helper tool to interoperate between Copilot and other languages.";
      description = "Ogma is a tool to facilitate the integration of safe runtime monitors into\nother systems. Ogma extends\n<https://github.com/Copilot-Language/copilot Copilot>, a high-level runtime\nverification framework that generates hard real-time C99 code.\n\nThis package implements the internal commands of ogma.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."copilot-core" or (errorHandler.buildDepError "copilot-core"))
          (hsPkgs."copilot-language" or (errorHandler.buildDepError "copilot-language"))
          (hsPkgs."copilot-libraries" or (errorHandler.buildDepError "copilot-libraries"))
          (hsPkgs."copilot-theorem" or (errorHandler.buildDepError "copilot-theorem"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."graphviz" or (errorHandler.buildDepError "graphviz"))
          (hsPkgs."hint" or (errorHandler.buildDepError "hint"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          (hsPkgs."ogma-extra" or (errorHandler.buildDepError "ogma-extra"))
          (hsPkgs."ogma-language-c" or (errorHandler.buildDepError "ogma-language-c"))
          (hsPkgs."ogma-language-copilot" or (errorHandler.buildDepError "ogma-language-copilot"))
          (hsPkgs."ogma-language-csv" or (errorHandler.buildDepError "ogma-language-csv"))
          (hsPkgs."ogma-language-jsonspec" or (errorHandler.buildDepError "ogma-language-jsonspec"))
          (hsPkgs."ogma-language-lustre" or (errorHandler.buildDepError "ogma-language-lustre"))
          (hsPkgs."ogma-language-smv" or (errorHandler.buildDepError "ogma-language-smv"))
          (hsPkgs."ogma-language-xlsx" or (errorHandler.buildDepError "ogma-language-xlsx"))
          (hsPkgs."ogma-language-xmlspec" or (errorHandler.buildDepError "ogma-language-xmlspec"))
          (hsPkgs."ogma-spec" or (errorHandler.buildDepError "ogma-spec"))
        ];
        buildable = true;
      };
      tests = {
        "unit-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."ogma-core" or (errorHandler.buildDepError "ogma-core"))
          ];
          buildable = true;
        };
      };
    };
  }