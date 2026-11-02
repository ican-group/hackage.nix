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
      specVersion = "3.0";
      identifier = { name = "yamlscript"; version = "0.3.7.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Ingy döt Net <ingy@ingy.net>";
      author = "Ingy döt Net <ingy@ingy.net>";
      homepage = "https://yamlscript.org";
      url = "";
      synopsis = "Haskell bindings for YAMLScript";
      description = "Haskell bindings for YAMLScript, a functional\nprogramming language with YAML syntax.\n.\nYAMLScript allows you to add logic to your YAML files\nwhile maintaining compatibility with standard YAML.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
        ];
        libs = [ (pkgs."ys" or (errorHandler.sysDepError "ys")) ];
        buildable = true;
      };
      exes = {
        "yamlscript-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."yamlscript" or (errorHandler.buildDepError "yamlscript"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
          buildable = true;
        };
      };
      tests = {
        "yamlscript-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."yamlscript" or (errorHandler.buildDepError "yamlscript"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }