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
      specVersion = "2.4";
      identifier = { name = "ntfs"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "vpark45@gmail.com";
      author = "Joonkyu Park";
      homepage = "https://github.com/nattybear/ntfs";
      url = "";
      synopsis = "Pure Haskell library for reading NTFS disk images";
      description = "Low-level parsers for NTFS volume geometry, MFT records, attributes and\nrunlists, with a high-level file system API built on top.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
        ];
        buildable = true;
      };
      tests = {
        "ntfs-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ntfs" or (errorHandler.buildDepError "ntfs"))
          ];
          buildable = true;
        };
      };
    };
  }