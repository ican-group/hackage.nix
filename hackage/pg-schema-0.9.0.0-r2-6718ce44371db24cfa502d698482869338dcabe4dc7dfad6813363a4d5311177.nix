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
    flags = {
      time = true;
      uuid = true;
      case-insensitive = true;
      arbitrary = false;
      debug = false;
      flat = false;
      hashable = false;
    };
    package = {
      specVersion = "3.12";
      identifier = { name = "pg-schema"; version = "0.9.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Dmitry Olshansky";
      maintainer = "olshanskydr@gmail.com";
      author = "Dmitry Olshansky";
      homepage = "https://github.com/odr/pg-schema/tree/master/pg-schema#readme";
      url = "";
      synopsis = "Type-level definition of database schema and safe DML for PostgreSQL.";
      description = "A PostgreSQL library in which the compiler checks your queries. Two ideas make it different:\n\n* __The schema description is taken from the database itself__, so it cannot silently drift from it.\n  A generator reads a live database and writes a Haskell module that describes its tables, columns,\n  keys, relations and enums at the type level.\n* __An SQL query is not written but built in accordance with Haskell types and checked against the generated schema description.__ You describe which data you need\n  (fields, and related rows along foreign keys) and get one SQL query that reads exactly that.\n\nThe workflow:\n\n1. Create the database as usual (SQL or migrations). Relations are referred to by the names of\n   foreign key constraints (by default PostgreSQL names them @\\<table\\>_\\<columns\\>_fkey@).\n2. Generate the schema description with @updateSchemaFile@ from \"PgSchema.Generation\".\n3. Optionally, define data types: ordinary records with @Generic@, no instances needed.\n4. Write queries with the EDSL from \"PgSchema.DML\"; every name, type and relation is checked at compile time.\n\nLearn it in the <https://odr.github.io/pg-schema tutorial>; its complete code is in\n<https://github.com/odr/pg-schema/tree/master/tutorial>.\n\n== Schema definition\n\nUse @updateSchemaFile@ function from \"PgSchema.Generation\" module to generate type-level definition of database schema.\nYou can make several schemas with any parts of your database.\n\nUsually you make executable which imports this module and run it to generate schema definition.\nYou can run it on CI to check if schema definition is up to date.\n\n== Safe DML for PostgreSQL\n\nUse \"PgSchema.DML\" module to describe and generate (in runtime) safe DML for PostgreSQL.\nAll operations are statically checked and you can't write invalid SQL.\n\nWith @pg-schema@ you can select or insert/upsert data into tree-like ADT in one request.\n\n=== Example\n\nLet's say we have tables @shop.ord@, @shop.ord_pos@ and @shop.article@, where @ord_pos@\nreferences @ord@ and @article@. The foreign keys have the default names given by PostgreSQL:\n@ord_pos_ord_id_fkey@ and @ord_pos_article_id_fkey@. There are articles with ids 41 and 42,\nand we have generated the schema @MySch@ with @updateSchemaFile@ from \"PgSchema.Generation\".\n\nThen we can insert an order with its positions, and select orders with their positions and\narticles, using conditions for orders and positions. Each operation is one request.\n\n> type ShopAnn tabName = 'Ann RenamerId MySch 5 (\"shop\" ->> tabName)\n>\n> -- An order with its positions to insert\n> type OrdIn = \"num\" := Text :. \"ord_pos_ord_id_fkey\" := [OrdPosIn]\n> type OrdPosIn = \"num\" := Int32 :. \"article_id\" := Int32 :. \"price\" := Double\n>\n> -- Orders to select: with positions and their articles\n> data Order = Order { num :: Text, created_at :: Day, ord_pos_ord_id_fkey :: [OrdPos] } deriving Generic\n> data OrdPos = OrdPos { num :: Int32, ord_pos_article_id_fkey :: Article, price :: Double } deriving Generic\n> data Article = Article { name :: Text } deriving Generic\n>\n> example :: Connection -> Day -> IO [Order]\n> example conn someDay = do\n>   void $ insertJSON_ (ShopAnn \"ord\") conn $ rowsOf @OrdIn\n>     [ \"num1\" :. [ 1 :. 42 :. 10, 2 :. 41 :. 15 ] ]\n>   fst <$> selectSch (ShopAnn \"ord\") conn (qRoot do\n>     qWhere $ \"created_at\" >=? someDay\n>     qOrderBy [descf \"created_at\", descf \"num\"]\n>     qPath \"ord_pos_ord_id_fkey\" do\n>       qWhere $ \"price\" >? (12 :: Double)\n>       qOrderBy [ascf \"num\"])\n\nNote that all table names, field names and foreign key constraint names are checked at compile time!\n\n=== Structure of modules\n\n* \"PgSchema.Generation\" - module with generation functions.\n  Usually you make executable which generates schema definition using this module.\n* \"PgSchema.DML\" - module with DML functions.\n  Import this module into your application and use it to generate safe DML for PostgreSQL.\n* \"PgSchema.Import\" - generated schema module imports this module.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ((((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."postgresql-simple" or (errorHandler.buildDepError "postgresql-simple"))
          (hsPkgs."postgresql-libpq" or (errorHandler.buildDepError "postgresql-libpq"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."singletons" or (errorHandler.buildDepError "singletons"))
          (hsPkgs."singletons-th" or (errorHandler.buildDepError "singletons-th"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optional (flags.time) (hsPkgs."time" or (errorHandler.buildDepError "time"))) ++ pkgs.lib.optional (flags.uuid) (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))) ++ pkgs.lib.optional (flags.case-insensitive) (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))) ++ pkgs.lib.optional (flags.flat) (hsPkgs."flat" or (errorHandler.buildDepError "flat"))) ++ pkgs.lib.optional (flags.arbitrary) (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))) ++ pkgs.lib.optional (flags.hashable) (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"));
        buildable = true;
      };
      tests = {
        "json-spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."pg-schema" or (errorHandler.buildDepError "pg-schema"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "test-gen" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."pg-schema" or (errorHandler.buildDepError "pg-schema"))
            (hsPkgs."postgresql-simple" or (errorHandler.buildDepError "postgresql-simple"))
          ];
          buildable = true;
        };
        "test-pgs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."pg-schema" or (errorHandler.buildDepError "pg-schema"))
            (hsPkgs."postgresql-simple" or (errorHandler.buildDepError "postgresql-simple"))
            (hsPkgs."resource-pool" or (errorHandler.buildDepError "resource-pool"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (errorHandler.buildDepError "tasty-hedgehog"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."ghc-heap" or (errorHandler.buildDepError "ghc-heap"))
          ] ++ pkgs.lib.optional (flags.hashable) (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"));
          buildable = true;
        };
      };
    };
  }