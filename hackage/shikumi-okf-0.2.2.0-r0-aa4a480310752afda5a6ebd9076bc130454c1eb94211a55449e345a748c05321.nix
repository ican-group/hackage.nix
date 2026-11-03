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
      identifier = { name = "shikumi-okf"; version = "0.2.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Generate OKF documentation bundles from shikumi programs (EP-31)";
      description = "An opt-in generator that documents shikumi @Program@ values as an Open\nKnowledge Format (OKF) bundle: one @Shikumi App@ concept that links to one\n@Shikumi Program@ concept per program an application ships. Given a\nuser-supplied 'Shikumi.Okf.Types.ProgramManifest' of named programs, it builds\nMarkdown concept documents (frontmatter + a body rendered from the program's\nstructure and the author's declared metadata) and writes them to disk through\nthe @okf-core@ producer API.\n.\nThe heavy @okf-core@ dependency is isolated in this package — mirroring how\n@shikumi-trace-otel@ quarantines the OpenTelemetry tree — so shikumi users who\ndo not care about OKF never depend on it.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."okf-core" or (errorHandler.buildDepError "okf-core"))
          (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      exes = {
        "shikumi-okf-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-okf" or (errorHandler.buildDepError "shikumi-okf"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "shikumi-okf-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."okf-core" or (errorHandler.buildDepError "okf-core"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-okf" or (errorHandler.buildDepError "shikumi-okf"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }