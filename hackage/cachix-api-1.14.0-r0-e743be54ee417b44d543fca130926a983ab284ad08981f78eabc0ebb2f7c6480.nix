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
    flags = { ram = true; };
    package = {
      specVersion = "2.2";
      identifier = { name = "cachix-api"; version = "1.14.0"; };
      license = "Apache-2.0";
      copyright = "2018 Domen Kozar";
      maintainer = "domen@cachix.org";
      author = "Domen Kozar";
      homepage = "https://github.com/cachix/cachix#readme";
      url = "";
      synopsis = "Servant HTTP API specification for https://cachix.org";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."deriving-aeson" or (errorHandler.buildDepError "deriving-aeson"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."http-media" or (errorHandler.buildDepError "http-media"))
          (hsPkgs."jose" or (errorHandler.buildDepError "jose"))
          (hsPkgs."nix-narinfo" or (errorHandler.buildDepError "nix-narinfo"))
          (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
          (hsPkgs."protolude" or (errorHandler.buildDepError "protolude"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."safe-exceptions" or (errorHandler.buildDepError "safe-exceptions"))
          (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
          (hsPkgs."servant-auth" or (errorHandler.buildDepError "servant-auth"))
          (hsPkgs."stm-chans" or (errorHandler.buildDepError "stm-chans"))
          (hsPkgs."swagger2" or (errorHandler.buildDepError "swagger2"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
        ] ++ (if flags.ram
          then [
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
          ]
          else [
            (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            (hsPkgs."memory" or (errorHandler.buildDepError "memory"))
          ]);
        buildable = true;
      };
      tests = {
        "cachix-api-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cachix-api" or (errorHandler.buildDepError "cachix-api"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."protolude" or (errorHandler.buildDepError "protolude"))
            (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }