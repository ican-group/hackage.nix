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
    flags = { demo = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "jsaddle-terminal"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Hamish.K.Mackenzie@gmail.com";
      author = "Hamish Mackenzie";
      homepage = "";
      url = "";
      synopsis = "Run jsaddle apps in a tmux pane, tunnelling over stdin/stdout";
      description = "A jsaddle transport for executables that run inside a tmux pane.  When a\nwatching IDE (leksah) answers the handshake, jsaddle Batch/Results JSON is\ntunnelled over the process's own stdin/stdout — framed as OSC 5799 escape\nsequences on stdout (delivered to the IDE via tmux control-mode %output)\nand RS-prefixed lines on stdin (injected via tmux send-keys -H) — and the\nUI renders in an iframe hosted by the IDE.  No sockets are opened on the\napp's machine, so it works over ssh-reached tmux servers too.  When nobody\nanswers the handshake there is nothing to tunnel to, so the runner reports\nthat on stderr and stops (an earlier version fell back to serving the app\nover jsaddle-warp; that has been removed).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
        ] ++ (if system.isWindows
          then [ (hsPkgs."Win32" or (errorHandler.buildDepError "Win32")) ]
          else [ (hsPkgs."unix" or (errorHandler.buildDepError "unix")) ]);
        buildable = true;
      };
      exes = {
        "jsaddle-terminal-demo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."ghcjs-dom" or (errorHandler.buildDepError "ghcjs-dom"))
            (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
            (hsPkgs."jsaddle-terminal" or (errorHandler.buildDepError "jsaddle-terminal"))
            (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
            (hsPkgs."reflex-dom-core" or (errorHandler.buildDepError "reflex-dom-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if system.isWindows || !flags.demo then false else true;
        };
      };
      tests = {
        "jsaddle-terminal-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."jsaddle-terminal" or (errorHandler.buildDepError "jsaddle-terminal"))
          ];
          buildable = if system.isWindows then false else true;
        };
      };
    };
  }