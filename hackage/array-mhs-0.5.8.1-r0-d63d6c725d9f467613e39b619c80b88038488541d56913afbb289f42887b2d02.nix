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
      identifier = { name = "array-mhs"; version = "0.5.8.1"; };
      license = "Apache-2.0";
      copyright = "2025 Lennart Augustsson";
      maintainer = "lennart@augustsson.net";
      author = "";
      homepage = "";
      url = "";
      synopsis = "Mutable and immutable arrays";
      description = "This is a copy of the array package adapted for MicroHs.\n\nIn addition to providing the \"Data.Array\" module\n<http://www.haskell.org/onlinereport/haskell2010/haskellch14.html as specified in the Haskell 2010 Language Report>,\nthis package also defines the classes 'IArray' of\nimmutable arrays and 'MArray' of arrays mutable within appropriate\nmonads, as well as some instances of these classes.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }