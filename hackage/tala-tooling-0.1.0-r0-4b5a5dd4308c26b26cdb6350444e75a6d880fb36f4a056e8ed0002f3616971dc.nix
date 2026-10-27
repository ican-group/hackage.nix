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
      identifier = { name = "tala-tooling"; version = "0.1.0"; };
      license = "MPL-2.0";
      copyright = "";
      maintainer = "support@progmasoft.com";
      author = "Progmasoft";
      homepage = "https://tala.run/";
      url = "";
      synopsis = "The part of the Tala compiler that tools build on";
      description = "The modules of the Tala compiler that a formatter, a linter or a\nlanguage server needs: the source text and its positions, the tokens,\nthe syntax tree, the diagnostics, the frontend and the compiler entry\nthat runs every check. Tools depend on this package alone; the other\ncompiler packages are its implementation and may change in any release.\n.\nThe source is also offered under the Progmasoft Linking Exception 1.1\n(LICENSE-EXCEPTION), an additional permission to MPL-2.0 for works that\ncombine this package with independent code.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."tala-compiler" or (errorHandler.buildDepError "tala-compiler"))
          (hsPkgs."tala-frontend" or (errorHandler.buildDepError "tala-frontend"))
          (hsPkgs."tala-syntax" or (errorHandler.buildDepError "tala-syntax"))
        ];
        buildable = true;
      };
    };
  }