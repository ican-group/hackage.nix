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
      nollmdependencies = false;
      assistant = true;
      production = true;
      botan = false;
      torrentparser = true;
      magicmime = true;
      ospath = true;
      benchmark = true;
      debuglocks = false;
      dbus = true;
      blake3 = true;
      xxh3 = false;
      tastytap = true;
      memory = true;
    };
    package = {
      specVersion = "1.12";
      identifier = { name = "git-annex"; version = "10.20261026"; };
      license = "AGPL-3.0-only";
      copyright = "2010-2026 Joey Hess";
      maintainer = "Joey Hess <id@joeyh.name>";
      author = "Joey Hess";
      homepage = "http://git-annex.branchable.com/";
      url = "";
      synopsis = "manage files with git, without checking their contents into git";
      description = "git-annex allows managing files with git, without checking the file\ncontents into git. While that may seem paradoxical, it is useful when\ndealing with files larger than git can currently easily handle, whether due\nto limitations in memory, time, or disk space.\n\nIt can store large files in many places, from local hard drives, to a\nlarge number of cloud storage services, including S3, WebDAV,\nand rsync, and many other usable via plugins.\nFiles can be stored encrypted with gpg, so that the cloud storage\nprovider cannot see your data. git-annex keeps track of where each file\nis stored, so it knows how many copies are available, and has many\nfacilities to ensure your data is preserved.\n\ngit-annex can also be used to keep a folder in sync between computers,\nnoticing when files are changed, and automatically committing them\nto git and transferring them to other computers. The git-annex webapp\nmakes it easy to set up and use git-annex this way.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.pkgsBuildBuild.base or (pkgs.pkgsBuildBuild.base or (errorHandler.setupDepError "base")))
        (hsPkgs.pkgsBuildBuild.split or (pkgs.pkgsBuildBuild.split or (errorHandler.setupDepError "split")))
        (hsPkgs.pkgsBuildBuild.filepath or (pkgs.pkgsBuildBuild.filepath or (errorHandler.setupDepError "filepath")))
        (hsPkgs.pkgsBuildBuild.exceptions or (pkgs.pkgsBuildBuild.exceptions or (errorHandler.setupDepError "exceptions")))
        (hsPkgs.pkgsBuildBuild.bytestring or (pkgs.pkgsBuildBuild.bytestring or (errorHandler.setupDepError "bytestring")))
        (hsPkgs.pkgsBuildBuild.filepath-bytestring or (pkgs.pkgsBuildBuild.filepath-bytestring or (errorHandler.setupDepError "filepath-bytestring")))
        (hsPkgs.pkgsBuildBuild.process or (pkgs.pkgsBuildBuild.process or (errorHandler.setupDepError "process")))
        (hsPkgs.pkgsBuildBuild.time or (pkgs.pkgsBuildBuild.time or (errorHandler.setupDepError "time")))
        (hsPkgs.pkgsBuildBuild.directory or (pkgs.pkgsBuildBuild.directory or (errorHandler.setupDepError "directory")))
        (hsPkgs.pkgsBuildBuild.async or (pkgs.pkgsBuildBuild.async or (errorHandler.setupDepError "async")))
        (hsPkgs.pkgsBuildBuild.utf8-string or (pkgs.pkgsBuildBuild.utf8-string or (errorHandler.setupDepError "utf8-string")))
        (hsPkgs.pkgsBuildBuild.Cabal or (pkgs.pkgsBuildBuild.Cabal or (errorHandler.setupDepError "Cabal")))
      ];
    };
    components = {
      exes = {
        "git-annex" = {
          depends = (((((((((((([
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
            (hsPkgs."unix-compat" or (errorHandler.buildDepError "unix-compat"))
            (hsPkgs."SafeSemaphore" or (errorHandler.buildDepError "SafeSemaphore"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."disk-free-space" or (errorHandler.buildDepError "disk-free-space"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."IfElse" or (errorHandler.buildDepError "IfElse"))
            (hsPkgs."monad-logger" or (errorHandler.buildDepError "monad-logger"))
            (hsPkgs."free" or (errorHandler.buildDepError "free"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."sandi" or (errorHandler.buildDepError "sandi"))
            (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."bloomfilter" or (errorHandler.buildDepError "bloomfilter"))
            (hsPkgs."edit-distance" or (errorHandler.buildDepError "edit-distance"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
            (hsPkgs."http-client-restricted" or (errorHandler.buildDepError "http-client-restricted"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."persistent-sqlite" or (errorHandler.buildDepError "persistent-sqlite"))
            (hsPkgs."persistent-template" or (errorHandler.buildDepError "persistent-template"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
            (hsPkgs."microlens" or (errorHandler.buildDepError "microlens"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."tagsoup" or (errorHandler.buildDepError "tagsoup"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."feed" or (errorHandler.buildDepError "feed"))
            (hsPkgs."regex-tdfa" or (errorHandler.buildDepError "regex-tdfa"))
            (hsPkgs."socks" or (errorHandler.buildDepError "socks"))
            (hsPkgs."stm-chans" or (errorHandler.buildDepError "stm-chans"))
            (hsPkgs."crypto-api" or (errorHandler.buildDepError "crypto-api"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."concurrent-output" or (errorHandler.buildDepError "concurrent-output"))
            (hsPkgs."unbounded-delays" or (errorHandler.buildDepError "unbounded-delays"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-rerun" or (errorHandler.buildDepError "tasty-rerun"))
            (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
            (hsPkgs."DAV" or (errorHandler.buildDepError "DAV"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."network-bsd" or (errorHandler.buildDepError "network-bsd"))
            (hsPkgs."git-lfs" or (errorHandler.buildDepError "git-lfs"))
            (hsPkgs."clock" or (errorHandler.buildDepError "clock"))
            (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
            (hsPkgs."servant-server" or (errorHandler.buildDepError "servant-server"))
            (hsPkgs."servant-client" or (errorHandler.buildDepError "servant-client"))
            (hsPkgs."servant-client-core" or (errorHandler.buildDepError "servant-client-core"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
            (hsPkgs."crypton-connection" or (errorHandler.buildDepError "crypton-connection"))
            (hsPkgs."crypton-x509-store" or (errorHandler.buildDepError "crypton-x509-store"))
            (hsPkgs."aws" or (errorHandler.buildDepError "aws"))
          ] ++ (if flags.nollmdependencies
            then [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
              (hsPkgs."persistent" or (errorHandler.buildDepError "persistent"))
              (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
              (hsPkgs."magic" or (errorHandler.buildDepError "magic"))
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
              (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            ]
            else [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."persistent" or (errorHandler.buildDepError "persistent"))
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
              (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            ])) ++ (if flags.memory
            then [
              (hsPkgs."memory" or (errorHandler.buildDepError "memory"))
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            ]
            else [
              (hsPkgs."ram" or (errorHandler.buildDepError "ram"))
              (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
            ])) ++ (if flags.ospath
            then [
              (hsPkgs."os-string" or (errorHandler.buildDepError "os-string"))
              (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
              (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
              (hsPkgs."file-io" or (errorHandler.buildDepError "file-io"))
            ]
            else [
              (hsPkgs."filepath-bytestring" or (errorHandler.buildDepError "filepath-bytestring"))
            ])) ++ pkgs.lib.optional (flags.botan) (hsPkgs."botan-low" or (errorHandler.buildDepError "botan-low"))) ++ pkgs.lib.optional (flags.blake3 && (!system.isAarch64 && !system.isArm)) (hsPkgs."blake3" or (errorHandler.buildDepError "blake3"))) ++ pkgs.lib.optionals (flags.xxh3) [
            (hsPkgs."xxhash-ffi" or (errorHandler.buildDepError "xxhash-ffi"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          ]) ++ pkgs.lib.optional (flags.tastytap) (hsPkgs."tasty-tap" or (errorHandler.buildDepError "tasty-tap"))) ++ (if system.isWindows
            then [
              (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))
              (hsPkgs."setenv" or (errorHandler.buildDepError "setenv"))
              (hsPkgs."process" or (errorHandler.buildDepError "process"))
              (hsPkgs."silently" or (errorHandler.buildDepError "silently"))
            ]
            else [
              (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ])) ++ pkgs.lib.optionals (flags.assistant && !system.isSolaris && !system.isHurd) (([
            (hsPkgs."mountpoints" or (errorHandler.buildDepError "mountpoints"))
            (hsPkgs."path-pieces" or (errorHandler.buildDepError "path-pieces"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-extra" or (errorHandler.buildDepError "wai-extra"))
            (hsPkgs."blaze-builder" or (errorHandler.buildDepError "blaze-builder"))
            (hsPkgs."clientsession" or (errorHandler.buildDepError "clientsession"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."shakespeare" or (errorHandler.buildDepError "shakespeare"))
          ] ++ [
            (hsPkgs."yesod" or (errorHandler.buildDepError "yesod"))
            (hsPkgs."yesod-static" or (errorHandler.buildDepError "yesod-static"))
            (hsPkgs."yesod-form" or (errorHandler.buildDepError "yesod-form"))
            (hsPkgs."yesod-core" or (errorHandler.buildDepError "yesod-core"))
          ]) ++ (if system.isLinux
            then [
              (hsPkgs."hinotify" or (errorHandler.buildDepError "hinotify"))
            ]
            else if system.isOsx
              then [
                (hsPkgs."hfsevents" or (errorHandler.buildDepError "hfsevents"))
              ]
              else pkgs.lib.optional (system.isWindows) (hsPkgs."Win32-notify" or (errorHandler.buildDepError "Win32-notify"))))) ++ pkgs.lib.optionals (flags.dbus) (pkgs.lib.optionals (system.isLinux) [
            (hsPkgs."dbus" or (errorHandler.buildDepError "dbus"))
            (hsPkgs."fdo-notify" or (errorHandler.buildDepError "fdo-notify"))
          ])) ++ pkgs.lib.optional (flags.torrentparser) (hsPkgs."torrent" or (errorHandler.buildDepError "torrent"))) ++ pkgs.lib.optional (flags.magicmime) (hsPkgs."magic" or (errorHandler.buildDepError "magic"))) ++ pkgs.lib.optional (flags.benchmark) (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"));
          buildable = true;
        };
      };
    };
  }