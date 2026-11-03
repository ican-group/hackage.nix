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
      specVersion = "3.4";
      identifier = { name = "shikumi-trace-otel"; version = "0.1.3.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "OpenTelemetry export of shikumi hierarchical trace trees (EP-7)";
      description = "An opt-in OpenTelemetry adapter for shikumi's hierarchical trace trees.\n'Shikumi.Trace.OpenTelemetry.exportTree' walks a finished 'TraceTree' and emits\none OTel span per node, preserving parent/child nesting (each child span is\ncreated in a context carrying its parent span). LM-call spans carry GenAI\nsemantic-convention attributes; every span carries @shikumi.@-prefixed\nspan-kind/cost/latency/retry attributes. The heavy @hs-opentelemetry-*@\ndependency tree is isolated in this package, mirroring baikai's\n@baikai-trace-otel@ split.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
          (hsPkgs."hs-opentelemetry-exporter-otlp" or (errorHandler.buildDepError "hs-opentelemetry-exporter-otlp"))
          (hsPkgs."hs-opentelemetry-sdk" or (errorHandler.buildDepError "hs-opentelemetry-sdk"))
          (hsPkgs."hs-opentelemetry-semantic-conventions" or (errorHandler.buildDepError "hs-opentelemetry-semantic-conventions"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
          (hsPkgs."shikumi-trace" or (errorHandler.buildDepError "shikumi-trace"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
        ];
        buildable = true;
      };
      tests = {
        "shikumi-trace-otel-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."hs-opentelemetry-api" or (errorHandler.buildDepError "hs-opentelemetry-api"))
            (hsPkgs."hs-opentelemetry-exporter-in-memory" or (errorHandler.buildDepError "hs-opentelemetry-exporter-in-memory"))
            (hsPkgs."hs-opentelemetry-sdk" or (errorHandler.buildDepError "hs-opentelemetry-sdk"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
            (hsPkgs."shikumi-eval" or (errorHandler.buildDepError "shikumi-eval"))
            (hsPkgs."shikumi-testing" or (errorHandler.buildDepError "shikumi-testing"))
            (hsPkgs."shikumi-trace" or (errorHandler.buildDepError "shikumi-trace"))
            (hsPkgs."shikumi-trace-otel" or (errorHandler.buildDepError "shikumi-trace-otel"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
          buildable = true;
        };
      };
    };
  }