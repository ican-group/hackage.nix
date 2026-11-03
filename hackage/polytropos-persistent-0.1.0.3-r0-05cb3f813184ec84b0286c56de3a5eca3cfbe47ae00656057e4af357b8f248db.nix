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
      identifier = { name = "polytropos-persistent"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "persistent database marshalling and entity wrappers for polytropos";
      description = "Integration bridging <https://hackage.haskell.org/package/polytropos polytropos> open records\nwith the Yesod ecosystem's <https://hackage.haskell.org/package/persistent persistent> relational database library.\n\nProvides fast zero-tuple marshalling of records to and from @['Database.Persist.Class.PersistField.PersistValue']@ rows\nvia 'Polytropos.Persistent.PersistRow' ('Polytropos.Persistent.toPersistFieldsRecord', 'Polytropos.Persistent.fromPersistValuesRecord'),\nwhole-record column storage as 'Database.Persist.Class.PersistField.PersistList' via\n'Database.Persist.Class.PersistField.PersistField' and 'Database.Persist.Sql.Class.PersistFieldSql',\nand entity wrappers via 'Polytropos.Persistent.PolyRowEntity'.\n\nStart at the front door module \"Polytropos.Persistent\" for complete documentation,\nschema mappings, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."persistent" or (errorHandler.buildDepError "persistent"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-persistent-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."persistent" or (errorHandler.buildDepError "persistent"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-persistent" or (errorHandler.buildDepError "polytropos-persistent"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }