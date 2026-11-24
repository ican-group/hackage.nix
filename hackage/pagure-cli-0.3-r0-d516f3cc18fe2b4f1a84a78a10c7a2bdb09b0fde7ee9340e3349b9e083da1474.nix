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
      specVersion = "1.18";
      identifier = { name = "pagure-cli"; version = "0.3"; };
      license = "GPL-2.0-only";
      copyright = "2019-2020,2022,2024-2026 Jens Petersen";
      maintainer = "Jens Petersen <juhpetersen@gmail.com>";
      author = "Jens Petersen <juhpetersen@gmail.com>";
      homepage = "https://github.com/juhp/pagure-cli";
      url = "";
      synopsis = "A Pagure gitforge query tool";
      description = "A command-line Pagure (gitforge) client for querying\nand listing projects, users, groups, and issues.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          (hsPkgs."http-query" or (errorHandler.buildDepError "http-query"))
          (hsPkgs."pagure" or (errorHandler.buildDepError "pagure"))
          (hsPkgs."simple-cmd" or (errorHandler.buildDepError "simple-cmd"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
        ] ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "9") (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"));
        buildable = true;
      };
      exes = {
        "pagure" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pagure-cli" or (errorHandler.buildDepError "pagure-cli"))
            (hsPkgs."simple-cmd-args" or (errorHandler.buildDepError "simple-cmd-args"))
          ] ++ pkgs.lib.optional (compiler.isGhc && compiler.version.lt "8.0") (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"));
          buildable = true;
        };
      };
    };
  }