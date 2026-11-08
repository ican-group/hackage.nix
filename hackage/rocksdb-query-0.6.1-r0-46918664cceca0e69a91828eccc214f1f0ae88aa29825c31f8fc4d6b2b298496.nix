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
      specVersion = "1.12";
      identifier = { name = "rocksdb-query"; version = "0.6.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "jprupp@protonmail.ch";
      author = "JP Rupp";
      homepage = "https://github.com/jprupp/rocksdb-query#readme";
      url = "";
      synopsis = "RocksDB database querying library for Haskell";
      description = "Please see the README on GitHub at <https://github.com/jprupp/rocksdb-query#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."rocksdb-haskell-jprupp" or (errorHandler.buildDepError "rocksdb-haskell-jprupp"))
        ];
        buildable = true;
      };
      tests = {
        "rocksdb-query-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."rocksdb-haskell-jprupp" or (errorHandler.buildDepError "rocksdb-haskell-jprupp"))
            (hsPkgs."rocksdb-query" or (errorHandler.buildDepError "rocksdb-query"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ];
          buildable = true;
        };
      };
    };
  }