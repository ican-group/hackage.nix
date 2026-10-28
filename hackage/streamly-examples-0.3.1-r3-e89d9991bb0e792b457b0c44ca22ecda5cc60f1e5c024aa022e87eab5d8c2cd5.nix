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
    flags = { fusion-plugin = true; sdl2 = false; interop = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "streamly-examples"; version = "0.3.1"; };
      license = "Apache-2.0";
      copyright = "Copyright (c) 2019 Composewell Technologies";
      maintainer = "streamly@composewell.com";
      author = "Composewell Technologies";
      homepage = "https://streamly.composewell.com";
      url = "";
      synopsis = "Examples for Streamly";
      description = "Practical examples to demonstrate the features and performance\nof Streamly.  Includes examples about file IO, text processing,\nnetworking, concurrent programming, reactive programming and\nmore.\n\nThese examples also serve as a beginner's guide to express practical\nprograms using the dataflow programming (streaming) model.  Please\nvisit the <https://streamly.composewell.com Streamly homepage> for\nmore details and comprehensive documentation.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "Interop.Vector" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) && flags.interop
            then true
            else false;
        };
        "Interop.Pipes" = {
          depends = ([
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"))) ++ pkgs.lib.optional (!(compiler.isGhcjs && true) && flags.interop) (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"));
          buildable = if !(compiler.isGhcjs && true) && flags.interop
            then true
            else false;
        };
        "Interop.Streaming" = {
          depends = ([
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"))) ++ pkgs.lib.optional (!(compiler.isGhcjs && true) && flags.interop) (hsPkgs."streaming" or (errorHandler.buildDepError "streaming"));
          buildable = if !(compiler.isGhcjs && true) && flags.interop
            then true
            else false;
        };
        "Interop.Conduit" = {
          depends = ([
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"))) ++ pkgs.lib.optional (!(compiler.isGhcjs && true) && flags.interop) (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"));
          buildable = if !(compiler.isGhcjs && true) && flags.interop
            then true
            else false;
        };
        "Intro" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "WordServer" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "MergeServer" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "CmdServer" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "CmdClient" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "ListDir" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = true;
        };
        "ListDirNaive" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = true;
        };
        "ListDirOsPath" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if compiler.isGhc && compiler.version.lt "9.6"
            then false
            else true;
        };
        "ListDirBasic" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if system.isWindows then false else true;
        };
        "MergeSort" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = true;
        };
        "AcidRain" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = true;
        };
        "CirclingSquare" = {
          depends = ([
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"))) ++ pkgs.lib.optionals (flags.sdl2) [
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
          ];
          frameworks = pkgs.lib.optionals (flags.sdl2) (pkgs.lib.optional (system.isOsx) (pkgs."Cocoa" or (errorHandler.sysDepError "Cocoa")));
          buildable = if flags.sdl2 then true else false;
        };
        "ControlFlow" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = true;
        };
        "CoreUtilsHandle" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = true;
        };
        "CoreUtils" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = true;
        };
        "EchoServer" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "EchoClient" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "FileSender" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "WordFrequency" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "WordCount" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "WordCountParallel" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "WordCountModular" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "WordCountParallelUTF8" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "CamelCase" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "CSVParser" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "Rate" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "Split" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "FileSystemEvent" = {
          depends = [
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "DateTimeParser" = {
          depends = ([
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"))) ++ pkgs.lib.optional (!(compiler.isGhcjs && true)) (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
        "LogParser" = {
          depends = ([
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."transformers-base" or (errorHandler.buildDepError "transformers-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin && !(compiler.isGhcjs && true) && !(compiler.isGhc && compiler.version.lt "8.6")) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"))) ++ pkgs.lib.optional (!(compiler.isGhcjs && true)) (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"));
          buildable = if !(compiler.isGhcjs && true) then true else false;
        };
      };
    };
  }