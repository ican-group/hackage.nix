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
    flags = { ghc-lib = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "ghc-tags-core"; version = "1.0.0.0"; };
      license = "MPL-2.0";
      copyright = "(c) 2020-2026, Marcin Szamotulski";
      maintainer = "coot@coot.me";
      author = "Marcin Szamotulski";
      homepage = "https://github.com/coot/ghc-tags-plugin#readme";
      url = "";
      synopsis = "CTags and ETags from Haskell syntax tree.";
      description = "A library to work with tags created from GHC syntax tree.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ (if compiler.isGhc && compiler.version.ge "9.6"
          then [
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ]
          else [
            (hsPkgs."filepath-bytestring" or (errorHandler.buildDepError "filepath-bytestring"))
          ])) ++ (if flags.ghc-lib
          then [ (hsPkgs."ghc-lib" or (errorHandler.buildDepError "ghc-lib")) ]
          else [ (hsPkgs."ghc" or (errorHandler.buildDepError "ghc")) ]);
        buildable = true;
      };
    };
  }