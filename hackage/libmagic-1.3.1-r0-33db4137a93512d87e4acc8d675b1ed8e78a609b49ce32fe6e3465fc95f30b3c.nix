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
      specVersion = "1.10";
      identifier = { name = "libmagic"; version = "1.3.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2005-2009 John Goerzen";
      maintainer = "Joey Hess <id@joeyh.name>";
      author = "John Goerzen";
      homepage = "";
      url = "";
      synopsis = "Interface to C file/magic library";
      description = "This package provides a Haskell interface to the C libmagic library.\nWith it, you can determine the type of a file by examining its contents\nrather than its name.  The Haskell interface provides a full-featured\nbinding.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
        ];
        libs = [ (pkgs."magic" or (errorHandler.sysDepError "magic")) ];
        buildable = true;
      };
    };
  }