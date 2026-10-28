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
      specVersion = "1.12";
      identifier = { name = "format-heavy"; version = "0.1.0.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Leonid Bobylev <l3o6@proton.me>";
      author = "Ilya Portnov";
      homepage = "https://github.com/lbobylev/format-heavy#format-heavy";
      url = "";
      synopsis = "Full-weight string formatting library, analog of Python's string.format";
      description = "This package contains full-featured string formatting function, similar to Python's string.format. Features include:\n* Automatically numbered variable placeholders;\n* Positional variable placeholders;\n* Named variable placeholders;\n* Placeholders can be used in any order; one variable can be used several\ntimes or not used at all.\n\n* Specific format can be used for each variable substitution.\nThis package prefers functionality over \"light weight\" and (probably) performance.  It also exposes all required interfaces to extend and customize it.\nSee the README and @examples/@ directory for details.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."labels" or (errorHandler.buildDepError "labels"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."th-lift" or (errorHandler.buildDepError "th-lift"))
          (hsPkgs."th-lift-instances" or (errorHandler.buildDepError "th-lift-instances"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."format-heavy" or (errorHandler.buildDepError "format-heavy"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }