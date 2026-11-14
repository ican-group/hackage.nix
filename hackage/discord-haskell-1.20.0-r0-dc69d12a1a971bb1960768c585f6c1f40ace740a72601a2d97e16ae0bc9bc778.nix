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
      identifier = { name = "discord-haskell"; version = "1.20.0"; };
      license = "MIT";
      copyright = "2019 Karl";
      maintainer = "ksfish5@gmail.com";
      author = "Karl";
      homepage = "https://github.com/discord-haskell/discord-haskell";
      url = "";
      synopsis = "Write bots for Discord in Haskell";
      description = "Functions and data types to write discord bots.\nOfficial discord docs <https://discord.com/developers/docs/reference>.\n\nSee the project readme for quickstart notes\n<https://github.com/discord-haskell/discord-haskell#discord-haskell->";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."emojis" or (errorHandler.buildDepError "emojis"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."iso8601-time" or (errorHandler.buildDepError "iso8601-time"))
          (hsPkgs."MonadRandom" or (errorHandler.buildDepError "MonadRandom"))
          (hsPkgs."req" or (errorHandler.buildDepError "req"))
          (hsPkgs."safe-exceptions" or (errorHandler.buildDepError "safe-exceptions"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."wuss" or (errorHandler.buildDepError "wuss"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."http-api-data" or (errorHandler.buildDepError "http-api-data"))
        ];
        buildable = true;
      };
      exes = {
        "ping-pong" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
          ];
          buildable = true;
        };
        "interaction-commands" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
          buildable = true;
        };
        "interaction-commands-simple" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
          ];
          buildable = true;
        };
        "cache" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
          ];
          buildable = true;
        };
        "gateway" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
          ];
          buildable = true;
        };
        "rest-without-gateway" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
          ];
          buildable = true;
        };
        "state-counter" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
          ];
          buildable = true;
        };
        "attachments" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."discord-haskell" or (errorHandler.buildDepError "discord-haskell"))
          ];
          buildable = true;
        };
      };
    };
  }