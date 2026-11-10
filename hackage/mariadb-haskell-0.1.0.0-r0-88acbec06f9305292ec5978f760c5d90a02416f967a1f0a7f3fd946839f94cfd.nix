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
    flags = { validation = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "mariadb-haskell"; version = "0.1.0.0"; };
      license = "BSD-3-Clause AND MPL-2.0";
      copyright = "(c) 2016 Winterland";
      maintainer = "Anton Antich <anton.antich@gmail.com>";
      author = "winterland1989";
      homepage = "https://github.com/aantich/mariadb-haskell";
      url = "";
      synopsis = "Alpha streaming Haskell driver for MariaDB";
      description = "Alpha software: extensively validated with automated tests and benchmarks,\nbut not yet validated in real-world applications. Evaluate in your own\nenvironment before relying on it; APIs and behavior may change.\n\nMariaDB-only fork of mysql-haskell. Streaming text and binary queries,\nmanaged prepared statements, native bulk execution, cached/extended metadata,\nsession observations and clean connection reset, streamed parameters,\nserver cursors, progress reporting and optional transport compression.\n\nTCP, Unix sockets and verified TLS, including client certificates and\nexplicit PAM/Kerberos authentication. Row-based CDC supports MariaDB GTID\nresume, complete-group checkpoints and manual semisync acknowledgements.\n\nSee the packaged README, user guide, migration guide and benchmark guide,\nor <https://github.com/aantich/mariadb-haskell>.\n<https://github.com/aantich/mariadb-haskell/blob/main/docs/USER_GUIDE.md User guide>;\n<https://github.com/aantich/mariadb-haskell/blob/main/docs/BENCHMARKS.md benchmarks>;\n<https://github.com/aantich/mariadb-haskell/blob/main/validation/RESULTS.md live validation>.\nPublic modules retain Database.MySQL names; MySQL servers are not supported.\nFull validation currently covers MariaDB 12.3.3 on macOS and Linux.\nLinux builds require zlib and MIT Kerberos development libraries;\nmacOS uses the system GSS framework. Windows GSSAPI is unavailable.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."asn1-encoding" or (errorHandler.buildDepError "asn1-encoding"))
          (hsPkgs."asn1-types" or (errorHandler.buildDepError "asn1-types"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."blaze-textual" or (errorHandler.buildDepError "blaze-textual"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."bytestring-lexing" or (errorHandler.buildDepError "bytestring-lexing"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton-x509" or (errorHandler.buildDepError "crypton-x509"))
          (hsPkgs."crypton-x509-store" or (errorHandler.buildDepError "crypton-x509-store"))
          (hsPkgs."crypton-x509-system" or (errorHandler.buildDepError "crypton-x509-system"))
          (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
          (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."crypton-pem" or (errorHandler.buildDepError "crypton-pem"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."word-compat" or (errorHandler.buildDepError "word-compat"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
        ];
        libs = pkgs.lib.optionals (!system.isOsx) (pkgs.lib.optional (!system.isWindows) (pkgs."gssapi_krb5" or (errorHandler.sysDepError "gssapi_krb5")));
        frameworks = pkgs.lib.optional (system.isOsx) (pkgs."GSS" or (errorHandler.sysDepError "GSS"));
        buildable = true;
      };
      exes = {
        "mariadb-validation" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
            (hsPkgs."mariadb-haskell" or (errorHandler.buildDepError "mariadb-haskell"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          ];
          buildable = if !flags.validation then false else true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
            (hsPkgs."mariadb-haskell" or (errorHandler.buildDepError "mariadb-haskell"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-expected-failure" or (errorHandler.buildDepError "tasty-expected-failure"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "integration" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."io-streams" or (errorHandler.buildDepError "io-streams"))
            (hsPkgs."mariadb-haskell" or (errorHandler.buildDepError "mariadb-haskell"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "binary-parsers-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."mariadb-haskell" or (errorHandler.buildDepError "mariadb-haskell"))
            (hsPkgs."scanner" or (errorHandler.buildDepError "scanner"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "bench24" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."mariadb-haskell" or (errorHandler.buildDepError "mariadb-haskell"))
          ];
          buildable = true;
        };
      };
    };
  }