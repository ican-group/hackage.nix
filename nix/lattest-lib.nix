{
  "0.1.0.0" = {
    sha256 = "62438dd3faf5a404cea50e19a3c94709d89a88b4f12963b172fecec42c4e9041";
    revisions = {
      r0 = {
        nix = import ../hackage/lattest-lib-0.1.0.0-r0-471f8081b2b718d4125d50ffbfaa9be848eb8e148f8c688b1950e363038549f6.nix;
        revNum = 0;
        sha256 = "471f8081b2b718d4125d50ffbfaa9be848eb8e148f8c688b1950e363038549f6";
      };
      default = "r0";
    };
  };
  "0.1.1" = {
    sha256 = "004f667c8016b77f5ffd6412d3ebec3c9f8cad8608779e663ff1fedd58fb49c1";
    revisions = {
      r0 = {
        nix = import ../hackage/lattest-lib-0.1.1-r0-4709ab83d31b6429eb7d9f93bfc8e294bde933a1f50c37a1711e9a93d4ead365.nix;
        revNum = 0;
        sha256 = "4709ab83d31b6429eb7d9f93bfc8e294bde933a1f50c37a1711e9a93d4ead365";
      };
      default = "r0";
    };
  };
  "0.2" = {
    sha256 = "22d4b3eadca7bdf8ad6bba5bbed3b77cdefcd34d555b5db2c2ccf092e1cab3a9";
    revisions = {
      r0 = {
        nix = import ../hackage/lattest-lib-0.2-r0-13ca71137f81c7981153d9cce29dc574d2a8de4c872c2cb176447c0641fe03ab.nix;
        revNum = 0;
        sha256 = "13ca71137f81c7981153d9cce29dc574d2a8de4c872c2cb176447c0641fe03ab";
      };
      r1 = {
        nix = import ../hackage/lattest-lib-0.2-r1-da5ace32b9456128a6e5d1a1f52736bb748f3498c1b0a5f2f1f4aff58f8a7780.nix;
        revNum = 1;
        sha256 = "da5ace32b9456128a6e5d1a1f52736bb748f3498c1b0a5f2f1f4aff58f8a7780";
      };
      default = "r1";
    };
  };
  "0.2.1" = {
    sha256 = "f78b5798230897b5d7d77be2aa3caffdcf1b54ac414f1a36c74a3f92d6935e05";
    revisions = {
      r0 = {
        nix = import ../hackage/lattest-lib-0.2.1-r0-ef50801156c3e64f3e640dc3fd9fd2dd6040fb97447362309599f5e6be67b641.nix;
        revNum = 0;
        sha256 = "ef50801156c3e64f3e640dc3fd9fd2dd6040fb97447362309599f5e6be67b641";
      };
      default = "r0";
    };
  };
}