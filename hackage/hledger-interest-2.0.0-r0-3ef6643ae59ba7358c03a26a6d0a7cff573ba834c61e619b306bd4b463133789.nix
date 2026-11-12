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
      identifier = { name = "hledger-interest"; version = "2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Peter Simons <simons@cryp.to>";
      author = "Peter Simons <simons@cryp.to>";
      homepage = "https://github.com/peti/hledger-interest";
      url = "";
      synopsis = "computes interest for a given account";
      description = "hledger-interest is a small command-line utility based on Simon\nMichael's hledger library. Its purpose is to compute interest for a\ngiven ledger account. Using command line flags, the program can be\nconfigured to use various schemes for day-counting, such as act\\/act,\n30\\/360, 30E\\/360, and 30E\\/360isda. It supports constant rates,\nannual interest with a fixed rate, and schedules of annual rates\nsupplied on the command line or read from a text file.\n\nAs an example, consider the loan in the regression fixture\n@tests/fixtures/boundaries.journal@:\n\n> 2023-01-31 Loan\n>     Assets:Bank          EUR 10000.00\n>     Liabilities:Loan\n>\n> 2023-02-28 Payment\n>     Assets:Bank          EUR -100.00\n>     Liabilities:Loan\n>\n> 2023-03-31 Payment\n>     Assets:Bank          EUR -100.00\n>     Liabilities:Loan\n>\n> 2023-07-01 Payment on rate change\n>     Assets:Bank          EUR -100.00\n>     Liabilities:Loan\n>\n> 2023-07-01 Second payment on same day\n>     Assets:Bank          EUR -50.00\n>     Liabilities:Loan\n>\n> 2024-01-15 Payment after year end\n>     Assets:Bank          EUR -100.00\n>     Liabilities:Loan\n>\n> 2024-02-29 Leap day payment\n>     Assets:Bank          EUR -100.00\n>     Liabilities:Loan\n>\n> 2024-03-31 Payment\n>     Assets:Bank          EUR -100.00\n>     Liabilities:Loan\n>\n> 2024-04-01 Unrelated transaction\n>     Assets:Bank          EUR -10.00\n>     Expenses:Other\n\nWith 5% annual interest and actual-day counting, crediting interest\nto the loan account compounds it. The following command prints only\nthe generated interest postings; its output is checked by the\n@annual-act@ golden test:\n\n> $ hledger-interest --file=tests/fixtures/boundaries.journal --source=Expenses:Interest --target=Liabilities:Loan --act --annual=0.05 --quiet Liabilities:Loan\n> 2023-02-28 5% interest for EUR -10000.00 over 28 days\n>     Liabilities:Loan       EUR -38.36\n>     Expenses:Interest       EUR 38.36\n>\n> 2023-03-31 5% interest for EUR -9938.36 over 31 days\n>     Liabilities:Loan       EUR -42.20\n>     Expenses:Interest       EUR 42.20\n>\n> 2023-07-01 5% interest for EUR -9880.56 over 92 days\n>     Liabilities:Loan      EUR -124.52\n>     Expenses:Interest      EUR 124.52\n>\n> 2023-12-31 5% interest for EUR -9855.08 over 183 days\n>     Liabilities:Loan      EUR -247.05\n>     Expenses:Interest      EUR 247.05\n>\n> 2024-01-15 5% interest for EUR -10102.13 over 15 days\n>     Liabilities:Loan       EUR -20.70\n>     Expenses:Interest       EUR 20.70\n>\n> 2024-02-29 5% interest for EUR -10022.84 over 45 days\n>     Liabilities:Loan       EUR -61.62\n>     Expenses:Interest       EUR 61.62\n>\n> 2024-03-31 5% interest for EUR -9984.45 over 31 days\n>     Liabilities:Loan       EUR -42.28\n>     Expenses:Interest       EUR 42.28\n\nRunning the utility with @--help@ gives a brief overview over the\navailable options:\n\n> Usage: hledger-interest [OPTION...] ACCOUNT\n> Default: post at transactions, rate-period ends, and year ends.\n>   -h          --help                      print this message and exit\n>   -V          --version                   show version number and exit\n>   -v          --verbose                   print matching input transactions and generated interest (default)\n>   -q          --quiet                     print generated interest only\n>               --today                     alias for --until=today\n>               --until=DATE                compute interest through DATE (YYYY-MM-DD or today);\n>                                           exclude transactions with later effective dates\n>               --post-on-transactions      post only at transactions (and at --until/--today);\n>                                           skip rate-period and automatic year-end postings;\n>                                           overrides --post-on-rate-changes\n>               --post-on-rate-changes      post at transactions and rate-period ends;\n>                                           skip automatic year-end postings;\n>                                           --post-on-transactions takes precedence;\n>                                           --until/--today also post on the final day\n>   -f FILE     --file=FILE                 input ledger file (pass '-' for stdin)\n>                                           default: $LEDGER_FILE or ~/.hledger.journal\n>   -s ACCOUNT  --source=ACCOUNT            interest source account\n>   -t ACCOUNT  --target=ACCOUNT            interest target account\n>   -I          --ignore-assertions         ignore any failing balance assertions\n>               --act                       use 'act/act' day counting convention\n>                                           (Actual/Actual ISDA; see README)\n>               --30-360                    use '30/360' day counting convention\n>               --30E-360                   use '30E/360' day counting convention\n>               --30E-360isda               use '30E/360isda' day counting convention\n>               --constant=RATE             fixed annual interest rate\n>               --annual=RATE               alias for --constant\n>               --schedule=SCHEDULE         annualized rates and their effective dates;\n>                                           rates are fractions: 0.05 means 5% per year\n>                                           syntax: '[(Date1,Rate1),(Date2,Rate2),...]'\n>               --schedule-file=PATH        read a schedule from a text file;\n>                                           one date and rate per line, starting in column 1;\n>                                           rates: 0.05 or 5%; hledger comments allowed\n>               --annual-schedule=SCHEDULE  alias for --schedule";
      buildType = "Simple";
    };
    components = {
      exes = {
        "hledger-interest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hledger-lib" or (errorHandler.buildDepError "hledger-lib"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."Decimal" or (errorHandler.buildDepError "Decimal"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          ];
          buildable = true;
        };
      };
      tests = {
        "regression" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."typed-process" or (errorHandler.buildDepError "typed-process"))
            (hsPkgs."Decimal" or (errorHandler.buildDepError "Decimal"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hledger-interest.components.exes.hledger-interest or (pkgs.pkgsBuildBuild.hledger-interest or (errorHandler.buildToolDepError "hledger-interest:hledger-interest")))
          ];
          buildable = true;
        };
        "calculations" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hledger-lib" or (errorHandler.buildDepError "hledger-lib"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."Decimal" or (errorHandler.buildDepError "Decimal"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }