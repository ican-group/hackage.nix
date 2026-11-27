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
      identifier = { name = "raft-consensus-wal"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Laurent P. René de Cotret";
      maintainer = "laurent.decotret@outlook.com";
      author = "Laurent P. René de Cotret";
      homepage = "https://github.com/LaurentRDC/distributed-consensus";
      url = "";
      synopsis = "Write-ahead log support for the raft-consensus library";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."file-io" or (errorHandler.buildDepError "file-io"))
          (hsPkgs."raft-consensus" or (errorHandler.buildDepError "raft-consensus"))
          (hsPkgs."wal" or (errorHandler.buildDepError "wal"))
        ];
        buildable = true;
      };
    };
  }