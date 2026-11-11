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
      specVersion = "3.14";
      identifier = { name = "cfv"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "harley.eades@gmail.com";
      author = "Harley D. Eades III";
      homepage = "https://github.com/heades/cfv";
      url = "";
      synopsis = "A simple file format for configuration variables";
      description = "Declare configuration variables in a '.cfv' file and parse them.\n\nAn example of the contents of a CFV file is:\n\n> -- a comment\n> greeting = 'hello';                   -- single-quoted string\n> empty    = \"\";                        -- double-quoted string\n> now      = `date +%s`;                -- run shell command\n> home'    = `echo \"$HOME\"`;            -- access to your shells PATH\n> secret api_key = \"password/token/key\" -- a secret variable (public is default)\n\nFor more information on the syntax of variable declarations see \"Configuration.Cfv\".";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      exes = {
        "cfv" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cfv" or (errorHandler.buildDepError "cfv"))
          ];
          buildable = true;
        };
      };
      tests = {
        "cfv-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."cfv" or (errorHandler.buildDepError "cfv"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }