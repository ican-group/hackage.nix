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
      identifier = { name = "scxml-statecharts"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Axel Ulmestig";
      maintainer = "axel.ulmestig@gmail.com";
      author = "Axel Ulmestig";
      homepage = "https://github.com/AxelUlmestig/scxml-statecharts";
      url = "";
      synopsis = "Typed statecharts from SCXML, via Template Haskell";
      description = "Define a statechart (<https://statecharts.dev/>) in SCXML inside a Haskell\nmodule and get typed states, events and a step function out of it.\n\n> [scxml|\n> <scxml initial=\"Draft\">\n>   <state id=\"Draft\"><transition event=\"Submit\" target=\"Review\"/></state>\n>   <state id=\"Review\">\n>     <onentry><script>notifyReviewers</script></onentry>\n>     <transition event=\"Approve\" target=\"Done\"/>\n>   </state>\n>   <final id=\"Done\"/>\n> </scxml>\n> |]\n\ngenerates @FsmState@, @FsmEvent@ and the functions\n@initiateStateMachine :: m FsmState@ and\n@notifyStateMachine :: FsmState -> FsmEvent -> m FsmState@, which call the\ncallbacks named in the @\\<script\\>@ elements. Compound states become sum\ntypes and parallel states become products, so a value of @FsmState@ is\nexactly one legal configuration: illegal states are unrepresentable and\n@case@ is exhaustive. Names in the XML are used verbatim as Haskell\nconstructor names.\n\nHierarchy, parallel regions, entry and exit callbacks and SCXML's\n@done.state@ completion events are supported. @cond@ guards and eventless\ntransitions are deliberately not: a decision becomes a state whose entry\ncallback raises one of the events leading out of it, which keeps the\nbranching visible in the chart.\n\nAn event can carry data, by naming the Haskell types its constructor holds\nafter it: @event=\"Order Item Int\"@ declares @Order Item Int@, and the\ncallbacks that transition runs receive the value with its payload. Transitions are still selected by event name alone. See the\nREADME for the full mapping and the list of unsupported SCXML features.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
        ];
        buildable = true;
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."scxml-statecharts" or (errorHandler.buildDepError "scxml-statecharts"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
      };
    };
  }