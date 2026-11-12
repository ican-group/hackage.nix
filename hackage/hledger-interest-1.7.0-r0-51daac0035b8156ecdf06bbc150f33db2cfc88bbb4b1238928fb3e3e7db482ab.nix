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
      identifier = { name = "hledger-interest"; version = "1.7.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Peter Simons <simons@cryp.to>";
      author = "Peter Simons <simons@cryp.to>";
      homepage = "https://github.com/peti/hledger-interest";
      url = "";
      synopsis = "computes interest for a given account";
      description = "hledger-interest is a small command-line utility based on Simon\nMichael's hledger library. Its purpose is to compute interest for a\ngiven ledger account. Using command line flags, the program can be\nconfigured to use various schemes for day-counting, such as act\\/act,\n30\\/360, 30E\\/360, and 30\\/360isda. Furthermore, it supports a (small)\nnumber of interest schemes, i.e. annual interest with a fixed rate and\nthe scheme mandated by the German BGB288 (Basiszins fuer\nVerbrauchergeschaefte). Extending support for other schemes is fairly\neasy, but currently requires changes to the source code.\n\nAs an example, consider the following loan, stored in a file called\n@test.ledger@:\n\n> 2008/09/26 Loan\n>     Assets:Bank          EUR 10000.00\n>     Liabilities:Bank\n>\n> 2008/11/27 Payment\n>     Assets:Bank          EUR -3771.12\n>     Liabilities:Bank\n>\n> 2009/05/03 Payment\n>     Assets:Bank          EUR -1200.00\n>     Liabilities:Bank\n>\n> 2010/12/10 Payment\n>     Assets:Bank          EUR -3700.00\n>     Liabilities:Bank\n\nSuppose that loan earns 5% interest per year, and payments amortize\ninterest before amortizing the principal claim, then the resulting\nledger would look like this:\n\n> $ hledger-interest --file=test.ledger --source=Expenses:Interest --target=Liabilities:Bank --30-360 --annual=0.05 Liabilities:Bank\n> 2008-09-26 Loan\n>     Assets:Bank          EUR 10000.00\n>     Liabilities:Bank    EUR -10000.00\n>\n> 2008-11-27 5% interest for EUR -10000.00 over 61 days\n>     Liabilities:Bank       EUR -84.72\n>     Expenses:Interest       EUR 84.72\n>\n> 2008-11-27 Payment\n>     Assets:Bank         EUR -3771.12\n>     Liabilities:Bank     EUR 3771.12\n>\n> 2008-12-31 5% interest for EUR -6313.60 over 34 days\n>     Liabilities:Bank       EUR -29.81\n>     Expenses:Interest       EUR 29.81\n>\n> 2009-05-03 5% interest for EUR -6343.42 over 123 days\n>     Liabilities:Bank      EUR -108.37\n>     Expenses:Interest      EUR 108.37\n>\n> 2009-05-03 Payment\n>     Assets:Bank         EUR -1200.00\n>     Liabilities:Bank     EUR 1200.00\n>\n> 2009-12-31 5% interest for EUR -5251.78 over 238 days\n>     Liabilities:Bank      EUR -173.60\n>     Expenses:Interest      EUR 173.60\n>\n> 2010-12-10 5% interest for EUR -5425.38 over 340 days\n>     Liabilities:Bank      EUR -256.20\n>     Expenses:Interest      EUR 256.20\n>\n> 2010-12-10 Payment\n>     Assets:Bank         EUR -3700.00\n>     Liabilities:Bank     EUR 3700.00\n\nRunning the utility with @--help@ gives a brief overview over the\navailable options:\n\n> Usage: hledger-interest [OPTION...] ACCOUNT\n>   -h          --help                      print this message and exit\n>   -V          --version                   show version number and exit\n>   -v          --verbose                   echo input ledger to stdout (default)\n>   -q          --quiet                     don't echo input ledger to stdout\n>               --today                     compute interest up until today\n>               --post-on-transactions      post interest only when the balance changes\n>                                           (and with --today), not at the end of\n>                                           every year or rate period\n>   -f FILE     --file=FILE                 input ledger file (pass '-' for stdin)\n>                                           default: $LEDGER_FILE or ~/.hledger.journal\n>   -s ACCOUNT  --source=ACCOUNT            interest source account\n>   -t ACCOUNT  --target=ACCOUNT            interest target account\n>   -I          --ignore-assertions         ignore any failing balance assertions\n>               --act                       use 'act/act' day counting convention\n>                                           (Actual/Actual ISDA; see README)\n>               --30-360                    use '30/360' day counting convention\n>               --30E-360                   use '30E/360' day counting convention\n>               --30E-360isda               use '30E/360isda' day counting convention\n>               --constant=RATE             constant interest rate\n>               --annual=RATE               annual interest rate\n>               --annual-schedule=SCHEDULE  schedule of annual interest rates.\n>                                           syntax: '[(Date1,Rate1),(Date2,Rate2),...]'\n>               --bgb288                    compute interest according to German BGB288\n>               --db24                      HACK: Deutsche Bank 24\n>               --ing-diba                  HACK: compute interest according for Ing-Diba Tagesgeld account";
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
          ];
          buildable = true;
        };
      };
    };
  }