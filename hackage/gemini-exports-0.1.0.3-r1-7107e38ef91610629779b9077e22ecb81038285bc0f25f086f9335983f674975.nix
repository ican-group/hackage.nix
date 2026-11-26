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
      identifier = { name = "gemini-exports"; version = "0.1.0.3"; };
      license = "BSD-3-Clause";
      copyright = "2026 Pavan Rikhi";
      maintainer = "pavan.rikhi@gmail.com";
      author = "Pavan Rikhi";
      homepage = "https://github.com/prikhi/gemini-exports#readme";
      url = "";
      synopsis = "Generate CSV Exports of Your Gemini Trades, Transfers, & Earn Transactions";
      description = "@gemini-exports@ is a CLI program that queries the Gemini Exchange's API\nfor your Trade History, Transfer History, & Earn History and exports all\nfetched data to a CSV file.\n\nYou can install @gemini-exports@ with Stack: @stack install --resolver\nnightly gemini-exports@. Then run the following to print out your complete\nhistory:\n\n@\n$ gemini-exports -k \\<API_KEY\\> -s \\<API_SECRET\\>\ntime,base-asset,quote-asset,type,description,price,quantity,total,fee,fee-currency,trade-id\n2022-04-20 04:20:00,GUSD,USD,Buy,,1.0,9001.0,9001.0,0.0,USD,900142424242\n@\n\nSee @gemini-exports --help@ for additional options, configuration file\ndetails, etc.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64" or (errorHandler.buildDepError "base64"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cassava" or (errorHandler.buildDepError "cassava"))
          (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
          (hsPkgs."req" or (errorHandler.buildDepError "req"))
          (hsPkgs."safe-exceptions" or (errorHandler.buildDepError "safe-exceptions"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."xdg-basedir" or (errorHandler.buildDepError "xdg-basedir"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
        ];
        buildable = true;
      };
      exes = {
        "gemini-exports" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gemini-exports" or (errorHandler.buildDepError "gemini-exports"))
          ];
          buildable = true;
        };
      };
      tests = {
        "gemini-exports-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gemini-exports" or (errorHandler.buildDepError "gemini-exports"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (errorHandler.buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }