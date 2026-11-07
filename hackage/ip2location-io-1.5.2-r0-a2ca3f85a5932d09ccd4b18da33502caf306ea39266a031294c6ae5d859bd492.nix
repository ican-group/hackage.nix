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
      identifier = { name = "ip2location-io"; version = "1.5.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "sales@ip2location.com";
      author = "IP2Location";
      homepage = "https://github.com/ip2location/ip2location-io-haskell";
      url = "";
      synopsis = "IP2Location.io Haskell package for IP geolocation and domain WHOIS.";
      description = "IP2Location.io Haskell SDK allows user to query for an enriched data set based on IP address and provides WHOIS lookup api that helps users to obtain domain information.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."uri-encode" or (errorHandler.buildDepError "uri-encode"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
        ];
        buildable = true;
      };
    };
  }