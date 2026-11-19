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
      identifier = { name = "memcache"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2012-2026 David Terei.";
      maintainer = "David Terei <code@davidterei.com>";
      author = "David Terei <code@davidterei.com>";
      homepage = "https://github.com/dterei/memcache-hs#readme";
      url = "";
      synopsis = "A memcached client library.";
      description = "A client library for a Memcached cluster. Memcached is an in-memory key-value\nstore typically used as a distributed and shared cache. Clients connect to a\ngroup of Memcached servers and perform out-of-band caching for things like\nSQL results, rendered pages, or third-party APIs.\n\nIt uses the Memcached Meta Text protocol and requires memcached 1.6.10 or\nnewer: each new connection checks the server's version, and refuses an\nolder server. Until the check passes, the only requests sent are the\nauthentication exchange, when credentials are set, and @version@.\nUsername/password authentication is supported through memcached's\n@-Y authfile@ mode; the binary protocol and SASL authentication are no longer\nsupported. It supports connecting to a single, or a cluster of Memcached\nservers. When connecting to a cluster, keys are routed by ketama consistent\nhashing, compatible with libmemcached's weighted ketama distribution.\nTimeouts, retrying failed operations, and failover to a different server are\nall supported, as is Amazon ElastiCache auto discovery.\n\nMulti-get is supported through the pipelined @getMany@. Keys containing\nwhitespace or control bytes are sent using the protocol's base64 binary-key\nmode.\n\nBasic usage is:\n\n> {-# LANGUAGE OverloadedStrings #-}\n>\n> import qualified Database.Memcache.Client as M\n>\n> main :: IO ()\n> main = do\n>     mc <- M.newClient [M.ServerSpec \"localhost\" \"11211\" M.NoAuth] M.def\n>     _ <- M.set mc \"key\" \"value\" 0 0\n>     v <- M.get mc \"key\"\n>     print v\n\nYou should only need to import 'Database.Memcache.Client', but other modules\nare exposed for lower-level use. Version 0.5 is a breaking change from 0.4.\nKeys are now routed by ketama, so with /n/ servers, upgrading moves all but\nabout one key in /n/ to a different server, once. The @optsServerRetries@\noption now counts retries, not attempts. Version 0.5, like 0.4.2.1, needs\nmemcached 1.6.10 or later. See /Upgrading from 0.4/ in the README, and the\nchangelog, for details.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."cryptohash-md5" or (errorHandler.buildDepError "cryptohash-md5"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."resource-pool" or (errorHandler.buildDepError "resource-pool"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."memcache" or (errorHandler.buildDepError "memcache"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
          buildable = true;
        };
        "integration" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."memcache" or (errorHandler.buildDepError "memcache"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "parser" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."memcache" or (errorHandler.buildDepError "memcache"))
          ];
          buildable = true;
        };
      };
    };
  }