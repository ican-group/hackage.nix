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
      identifier = {
        name = "raft-consensus-distributed-process";
        version = "0.1.0.0";
      };
      license = "BSD-3-Clause";
      copyright = "Laurent P. René de Cotret";
      maintainer = "laurent.decotret@outlook.com";
      author = "Laurent P. René de Cotret";
      homepage = "";
      url = "";
      synopsis = "Cloud Haskell facilities to the Raft consensus protocol";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."distributed-process" or (errorHandler.buildDepError "distributed-process"))
          (hsPkgs."raft-consensus-distributed-process".components.sublibs.io-classes-instances or (errorHandler.buildDepError "raft-consensus-distributed-process:io-classes-instances"))
          (hsPkgs."raft-consensus" or (errorHandler.buildDepError "raft-consensus"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
        ];
        buildable = true;
      };
      sublibs = {
        "io-classes-instances" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."distributed-process" or (errorHandler.buildDepError "distributed-process"))
            (hsPkgs."io-classes" or (errorHandler.buildDepError "io-classes"))
            (hsPkgs."io-classes".components.sublibs.si-timers or (errorHandler.buildDepError "io-classes:si-timers"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
        "client" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."distributed-process" or (errorHandler.buildDepError "distributed-process"))
            (hsPkgs."raft-consensus-distributed-process".components.sublibs.io-classes-instances or (errorHandler.buildDepError "raft-consensus-distributed-process:io-classes-instances"))
            (hsPkgs."raft-consensus" or (errorHandler.buildDepError "raft-consensus"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          ];
          buildable = true;
        };
        "admin" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."distributed-process" or (errorHandler.buildDepError "distributed-process"))
            (hsPkgs."raft-consensus-distributed-process".components.sublibs.io-classes-instances or (errorHandler.buildDepError "raft-consensus-distributed-process:io-classes-instances"))
            (hsPkgs."raft-consensus" or (errorHandler.buildDepError "raft-consensus"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          ];
          buildable = true;
        };
      };
      tests = {
        "rcdp-test" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."distributed-process" or (errorHandler.buildDepError "distributed-process"))
            (hsPkgs."raft-consensus-distributed-process" or (errorHandler.buildDepError "raft-consensus-distributed-process"))
            (hsPkgs."raft-consensus-distributed-process".components.sublibs.admin or (errorHandler.buildDepError "raft-consensus-distributed-process:admin"))
            (hsPkgs."raft-consensus-distributed-process".components.sublibs.client or (errorHandler.buildDepError "raft-consensus-distributed-process:client"))
            (hsPkgs."raft-consensus" or (errorHandler.buildDepError "raft-consensus"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."network-transport" or (errorHandler.buildDepError "network-transport"))
            (hsPkgs."network-transport-inmemory" or (errorHandler.buildDepError "network-transport-inmemory"))
          ];
          buildable = true;
        };
      };
    };
  }