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
      identifier = { name = "ogma-cli"; version = "1.17.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "ivan.perezdominguez@nasa.gov";
      author = "Ivan Perez, Alwyn Goodloe";
      homepage = "https://github.com/nasa/ogma";
      url = "";
      synopsis = "Ogma: Helper tool to interoperate between Copilot and other languages.";
      description = "Ogma is a tool to facilitate the integration of safe runtime monitors into\nother systems. Ogma extends\n<https://github.com/Copilot-Language/copilot Copilot>, a high-level runtime\nverification framework that generates hard real-time C99 code.\n\nSome use cases supported by Ogma include:\n\n- Translating requirements defined in structured natural\nlanguage into monitors in Copilot.\n\n- Generating the glue code necessary to work with C\nstructs in Copilot.\n\n- Generating\n<https://cfs.gsfc.nasa.gov/ NASA Core Flight System>\napplications that use Copilot for monitoring data\nreceived from the message bus.\n\n- Generating message handlers for NASA Core Flight System\napplications to make external data in structs available\nto a Copilot monitor.\n\n- Generating\n<https://ros.org Robot Operating System (ROS 2)>\napplications that use Copilot for monitoring data\nreceived from different topics.\n\n- Generating\n<https://github.com/nasa/fprime F'>\ncomponents that use Copilot for monitoring.\n\n- Generating monitors from state diagrams specified using\na graphical notation.\n\nThe main invocation with @--help@ lists sub-commands available.\n\n>$ ogma --help\n>ogma - an anything-to-Copilot application generator\n>\n>Usage: ogma COMMAND\n>  Generate complete or partial Copilot applications from multiple languages\n>\n>Available options:\n>  -h,--help                Show this help text\n>\n>Available commands:\n>  overview                 Generate an overview of the input specification(s)\n>  search                   List items that match search query\n>  structs                  Generate Copilot structs from C structs\n>  handlers                 Generate message handlers from C structs\n>  cfs                      Generate a complete CFS/Copilot application\n>  fprime                   Generate a complete F' monitoring component\n>  ros                      Generate a ROS 2 monitoring application\n>  standalone               Generate a Copilot file from an input specification\n>  diagram                  Generate a monitor from a state machine diagram\n>  report                   Generate a report of the input specification(s).\n\nFor further information, see:\n\n- <https://github.com/nasa/ogma The Ogma repository>.\n\n- <https://copilot-language.github.io/ The Copilot web page>.\n\n- <https://cfs.gsfc.nasa.gov/ The NASA Core Flight System web page>.\n\n- <https://ros.org/ The Robot Operating System (ROS 2) web page>.\n\n- <https://github.com/nasa/fprime The F' repository>.\n\n- \"<https://ntrs.nasa.gov/citations/20200003164 Copilot 3>\", Perez, Dedden and Goodloe. 2020.\n\n- \"<https://shemesh.larc.nasa.gov/people/cam/publications/FMAS2020_3.pdf From Requirements to Autonomous Flight>\", Dutle et al. 2020.";
      buildType = "Simple";
    };
    components = {
      exes = {
        "ogma" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."microstache" or (errorHandler.buildDepError "microstache"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."ogma-core" or (errorHandler.buildDepError "ogma-core"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test-ogma" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          buildable = true;
        };
      };
    };
  }