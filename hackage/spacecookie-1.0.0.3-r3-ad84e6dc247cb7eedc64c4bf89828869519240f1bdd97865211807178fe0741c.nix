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
      identifier = { name = "spacecookie"; version = "1.0.0.3"; };
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
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath-bytestring" or (errorHandler.buildDepError "filepath-bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."socket" or (errorHandler.buildDepError "socket"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."hxt-unicode" or (errorHandler.buildDepError "hxt-unicode"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
        ];
        buildable = true;
      };
      exes = {
        "spacecookie" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath-bytestring" or (errorHandler.buildDepError "filepath-bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."socket" or (errorHandler.buildDepError "socket"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."spacecookie" or (errorHandler.buildDepError "spacecookie"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."systemd" or (errorHandler.buildDepError "systemd"))
            (hsPkgs."fast-logger" or (errorHandler.buildDepError "fast-logger"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath-bytestring" or (errorHandler.buildDepError "filepath-bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
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