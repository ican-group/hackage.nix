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
      identifier = { name = "tala-syntax"; version = "0.1.0"; };
      license = "MPL-2.0";
      copyright = "";
      maintainer = "support@progmasoft.com";
      author = "Progmasoft";
      homepage = "https://tala.run/";
      url = "";
      synopsis = "Tala source model, lexer, parser, and diagnostics";
      description = "The source model of Tala: source text and positions, the lexer, the\nparser, the parsed syntax tree and diagnostics.\n.\nThis is an implementation package of the Tala compiler. Its modules may\nchange in any release; tools should depend on tala-tooling instead.\n.\nThe source is also offered under the Progmasoft Linking Exception 1.1\n(LICENSE-EXCEPTION), an additional permission to MPL-2.0 for works that\ncombine this package with independent code.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
        ];
        buildable = true;
      };
    };
  }