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
      specVersion = "2.0";
      identifier = { name = "hpgsql-simple-compat"; version = "0.4.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Marcelo Zabani\n(c) 2011 MailRank, Inc.\n(c) 2011-2018 Leon P Smith\n(c) 2018-2020 Oleg Grenrus\n(c) 2014 Aleksey Uimanov\n(c) 2010 Grant Monroe";
      maintainer = "Marcelo Zabani";
      author = "Bryan O'Sullivan, Leon P Smith, Aleksey Uimanov, Grant Monroe, Marcelo Zabani";
      homepage = "https://github.com/mzabani/hpgsql#readme";
      url = "";
      synopsis = "Fork of postgresql-simple implemented with hpgsql instead of postgresql-libpq.";
      description = "This is a fork of postgresql-simple that tries to preserve its API as much as possible, but\nuses hpgsql instead of postgresql-libpq under the hood.\nThe idea is to ease migrating to hpgsql itself. Check the GitHub for more information.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."hpgsql" or (errorHandler.buildDepError "hpgsql"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."time-compat" or (errorHandler.buildDepError "time-compat"))
          (hsPkgs."Only" or (errorHandler.buildDepError "Only"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
    };
  }