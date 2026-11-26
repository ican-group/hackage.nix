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
    flags = { install-daemon = true; };
    package = {
      specVersion = "3.0";
      identifier = { name = "spacecookie"; version = "1.1.0.1"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "sternenseemann@systemli.org";
      author = "Lukas Epple";
      homepage = "https://github.com/sternenseemann/spacecookie";
      url = "";
      synopsis = "Gopher server library and daemon";
      description = "Simple gopher library that allows writing custom gopher\napplications. Also includes a fully-featured gopher server\ndaemon complete with gophermap-support built on top of it.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
          (hsPkgs."socket" or (errorHandler.buildDepError "socket"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
        ];
        buildable = true;
      };
      exes = {
        "spacecookie" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."socket" or (errorHandler.buildDepError "socket"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."spacecookie" or (errorHandler.buildDepError "spacecookie"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."systemd" or (errorHandler.buildDepError "systemd"))
            (hsPkgs."fast-logger" or (errorHandler.buildDepError "fast-logger"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."file-io" or (errorHandler.buildDepError "file-io"))
          ];
          buildable = if !flags.install-daemon then false else true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-expected-failure" or (errorHandler.buildDepError "tasty-expected-failure"))
            (hsPkgs."spacecookie" or (errorHandler.buildDepError "spacecookie"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."download-curl" or (errorHandler.buildDepError "download-curl"))
          ];
          buildable = true;
        };
      };
    };
  }