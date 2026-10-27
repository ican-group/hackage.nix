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
    flags = { embed_data_files = true; http = true; };
    package = {
      specVersion = "2.4";
      identifier = { name = "pandoc"; version = "3.13"; };
      license = "GPL-2.0-or-later";
      copyright = "(c) 2006-2024 John MacFarlane";
      maintainer = "John MacFarlane <jgm@berkeley.edu>";
      author = "John MacFarlane <jgm@berkeley.edu>";
      homepage = "https://pandoc.org";
      url = "";
      synopsis = "Conversion between markup formats";
      description = "Pandoc is a Haskell library for converting from one markup\nformat to another.  The formats it can handle include\n\n- light markup formats (many variants of Markdown,\nreStructuredText, AsciiDoc, Org-mode, Muse, Textile,\ntxt2tags, djot, bbcode)\n- HTML formats (HTML 4 and 5, chunked HTML)\n- Ebook formats (EPUB v2 and v3, FB2)\n- Documentation formats (GNU TexInfo, Haddock, Vimdoc)\n- Roff formats (man, ms, mdoc)\n- TeX formats (LaTeX, ConTeXt)\n- Typst\n- ANSI-formatted text\n- XML formats (DocBook 4 and 5, JATS, TEI Simple, OpenDocument)\n- Outline formats (OPML)\n- Bibliography formats (BibTeX, BibLaTeX, CSL JSON, CSL YAML,\nRIS)\n- Word processor formats (Docx, RTF, ODT, FODT)\n- Interactive notebook formats (Jupyter notebook ipynb)\n- Page layout formats (InDesign ICML)\n- Wiki markup formats (MediaWiki, DokuWiki, TikiWiki, TWiki,\nVimwiki, XWiki, ZimWiki, Jira wiki, Creole)\n- Slide show formats (LaTeX Beamer, PowerPoint, Slidy,\nreveal.js, Slideous, S5, DZSlides)\n- Data formats (CSV and TSV tables, Excel spreadsheets)\n- Serialization formats (Haskell, JSON, or XML representation\nof the AST)\n- PDF (via external programs such as pdflatex or wkhtmltopdf)\n\nPandoc can convert mathematical content in documents\nbetween TeX, MathML, Word equations, roff eqn, typst,\nand plain text. It includes a powerful system for automatic\ncitations and bibliographies, and it can be customized\nextensively using templates, filters, and custom readers\nand writers written in Lua.\n\nFor the pandoc command-line program, see the\n@pandoc-cli@ package.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."pandoc".components.sublibs.xml-light or (errorHandler.buildDepError "pandoc:xml-light"))
          (hsPkgs."Glob" or (errorHandler.buildDepError "Glob"))
          (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."blaze-html" or (errorHandler.buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (errorHandler.buildDepError "blaze-markup"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."citeproc" or (errorHandler.buildDepError "citeproc"))
          (hsPkgs."commonmark" or (errorHandler.buildDepError "commonmark"))
          (hsPkgs."commonmark-extensions" or (errorHandler.buildDepError "commonmark-extensions"))
          (hsPkgs."commonmark-pandoc" or (errorHandler.buildDepError "commonmark-pandoc"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."doclayout" or (errorHandler.buildDepError "doclayout"))
          (hsPkgs."doctemplates" or (errorHandler.buildDepError "doctemplates"))
          (hsPkgs."emojis" or (errorHandler.buildDepError "emojis"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."gridtables" or (errorHandler.buildDepError "gridtables"))
          (hsPkgs."haddock-library" or (errorHandler.buildDepError "haddock-library"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."ipynb" or (errorHandler.buildDepError "ipynb"))
          (hsPkgs."jira-wiki-markup" or (errorHandler.buildDepError "jira-wiki-markup"))
          (hsPkgs."mime-types" or (errorHandler.buildDepError "mime-types"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."skylighting" or (errorHandler.buildDepError "skylighting"))
          (hsPkgs."skylighting-core" or (errorHandler.buildDepError "skylighting-core"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."tagsoup" or (errorHandler.buildDepError "tagsoup"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."texmath" or (errorHandler.buildDepError "texmath"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-conversions" or (errorHandler.buildDepError "text-conversions"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unicode-collation" or (errorHandler.buildDepError "unicode-collation"))
          (hsPkgs."unicode-data" or (errorHandler.buildDepError "unicode-data"))
          (hsPkgs."unicode-transforms" or (errorHandler.buildDepError "unicode-transforms"))
          (hsPkgs."yamlet" or (errorHandler.buildDepError "yamlet"))
          (hsPkgs."yamlet-aeson" or (errorHandler.buildDepError "yamlet-aeson"))
          (hsPkgs."zip-archive" or (errorHandler.buildDepError "zip-archive"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
          (hsPkgs."typst" or (errorHandler.buildDepError "typst"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."djot" or (errorHandler.buildDepError "djot"))
          (hsPkgs."asciidoc" or (errorHandler.buildDepError "asciidoc"))
        ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"))) ++ pkgs.lib.optionals (flags.http) [
          (hsPkgs."crypton-connection" or (errorHandler.buildDepError "crypton-connection"))
          (hsPkgs."crypton-x509-system" or (errorHandler.buildDepError "crypton-x509-system"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
        ];
        buildable = true;
      };
      sublibs = {
        "xml-light" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
            (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
            (hsPkgs."xml-types" or (errorHandler.buildDepError "xml-types"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test-pandoc" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pandoc" or (errorHandler.buildDepError "pandoc"))
            (hsPkgs."Diff" or (errorHandler.buildDepError "Diff"))
            (hsPkgs."Glob" or (errorHandler.buildDepError "Glob"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."doctemplates" or (errorHandler.buildDepError "doctemplates"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
            (hsPkgs."pandoc".components.sublibs.xml-light or (errorHandler.buildDepError "pandoc:xml-light"))
            (hsPkgs."zip-archive" or (errorHandler.buildDepError "zip-archive"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "benchmark-pandoc" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pandoc" or (errorHandler.buildDepError "pandoc"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ];
          buildable = true;
        };
      };
    };
  }