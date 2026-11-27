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
      identifier = { name = "hasql"; version = "2.1.0.0"; };
      license = "MIT";
      copyright = "(c) 2014, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/hasql";
      url = "";
      synopsis = "Fast PostgreSQL driver with a flexible mapping API";
      description = "Root of the \\\"hasql\\\" ecosystem.\nThis library provides connection management, execution of queries and mapping of parameters and results.\nExtended functionality such as pooling, transactions and compile-time checking of SQL is provided by extension libraries.\nFor more details and tutorials see <https://github.com/nikita-volkov/hasql the readme>.\n\nAll error-reporting is explicit:\ndatabase, protocol and connection failures are reported via the 'Either' type\ninstead of being thrown as exceptions.\n\nThe transport layer is pluggable via <https://hackage.haskell.org/package/pqi pqi>,\nso \\\"hasql\\\" itself carries no C dependency.\nTo compile an application you need to depend on \\\"hasql\\\" together with one adapter package\nand pass that adapter to @Hasql.Connection.acquire@ as its first argument.\nTwo adapters are available:\n\n* <https://hackage.haskell.org/package/pqi-ffi pqi-ffi> -\n  the stable, production-proven adapter, backed by the C \\\"libpq\\\" library.\n  It requires \\\"libpq\\\" of at least version 14 to be installed to compile.\n  \\\"libpq\\\" comes distributed with PostgreSQL,\n  so typically all you need is just to install the latest PostgreSQL distro.\n  Via this adapter \\\"hasql\\\" is thoroughly tested to be compatible\n  with a wide range of PostgreSQL servers starting from version 9.\n\n* <https://hackage.haskell.org/package/pqi-native pqi-native> -\n  a pure-Haskell adapter, which speaks the PostgreSQL wire protocol directly\n  and thus requires no C dependency at all.\n  It is thoroughly tested:\n  <https://github.com/nikita-volkov/pqi-conformance pqi-conformance> runs it\n  side by side with \\\"libpq\\\" on the same inputs and checks that the results agree,\n  and the test-suites of \\\"hasql\\\", \\\"hasql-pool\\\" and \\\"hasql-transaction\\\"\n  run against both adapters.\n  It is still labelled __alpha__, but is fully interchangeable with \\\"pqi-ffi\\\":\n  switching between the two is a one-line change.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."bytestring-strict-builder" or (errorHandler.buildDepError "bytestring-strict-builder"))
          (hsPkgs."hasql".components.sublibs.codecs-vocab or (errorHandler.buildDepError "hasql:codecs-vocab"))
          (hsPkgs."hasql".components.sublibs.comms or (errorHandler.buildDepError "hasql:comms"))
          (hsPkgs."hasql".components.sublibs.connection-state or (errorHandler.buildDepError "hasql:connection-state"))
          (hsPkgs."hasql".components.sublibs.platform or (errorHandler.buildDepError "hasql:platform"))
          (hsPkgs."hasql".components.sublibs.to-be-resolved or (errorHandler.buildDepError "hasql:to-be-resolved"))
          (hsPkgs."iproute" or (errorHandler.buildDepError "iproute"))
          (hsPkgs."postgresql-binary" or (errorHandler.buildDepError "postgresql-binary"))
          (hsPkgs."postgresql-connection-string" or (errorHandler.buildDepError "postgresql-connection-string"))
          (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      sublibs = {
        "platform" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."witherable" or (errorHandler.buildDepError "witherable"))
          ];
          buildable = true;
        };
        "to-be-resolved" = {
          depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = true;
        };
        "codecs-vocab" = {
          depends = [
            (hsPkgs."hasql".components.sublibs.platform or (errorHandler.buildDepError "hasql:platform"))
          ];
          buildable = true;
        };
        "connection-state" = {
          depends = [
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."bytestring-strict-builder" or (errorHandler.buildDepError "bytestring-strict-builder"))
            (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
            (hsPkgs."hasql".components.sublibs.codecs-vocab or (errorHandler.buildDepError "hasql:codecs-vocab"))
            (hsPkgs."hasql".components.sublibs.platform or (errorHandler.buildDepError "hasql:platform"))
            (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = true;
        };
        "comms" = {
          depends = [
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hasql".components.sublibs.platform or (errorHandler.buildDepError "hasql:platform"))
            (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      tests = {
        "profiling" = {
          depends = [
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
            (hsPkgs."testcontainers-postgresql" or (errorHandler.buildDepError "testcontainers-postgresql"))
          ];
          buildable = true;
        };
        "connection-state-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hasql".components.sublibs.codecs-vocab or (errorHandler.buildDepError "hasql:codecs-vocab"))
            (hsPkgs."hasql".components.sublibs.connection-state or (errorHandler.buildDepError "hasql:connection-state"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
        "library-tests" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."iproute" or (errorHandler.buildDepError "iproute"))
            (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
            (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
            (hsPkgs."pqi-native" or (errorHandler.buildDepError "pqi-native"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
            (hsPkgs."testcontainers" or (errorHandler.buildDepError "testcontainers"))
            (hsPkgs."testcontainers-postgresql" or (errorHandler.buildDepError "testcontainers-postgresql"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "benchmarks" = {
          depends = [
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."pqi-ffi" or (errorHandler.buildDepError "pqi-ffi"))
            (hsPkgs."pqi-native" or (errorHandler.buildDepError "pqi-native"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
          ];
          buildable = true;
        };
      };
    };
  }