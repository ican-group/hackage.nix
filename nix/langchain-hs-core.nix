{
  "0.0.5.0" = {
    sha256 = "9f620d52d8aadc1ffca9d1ef00dd22283d2efa5d6e6a87538475736740d0c7df";
    revisions = {
      r0 = {
        nix = import ../hackage/langchain-hs-core-0.0.5.0-r0-6cd442ffcc9d4de27fd3d39e12b0fabaffb8b5c15d5506ff016c3e3e39af9aeb.nix;
        revNum = 0;
        sha256 = "6cd442ffcc9d4de27fd3d39e12b0fabaffb8b5c15d5506ff016c3e3e39af9aeb";
      };
      default = "r0";
    };
  };
  "0.0.6.0" = {
    sha256 = "4f78b9aacc1cde9ea35ca667de6d932399c3d5531d0ac8d231793206d442c16a";
    revisions = {
      r0 = {
        nix = import ../hackage/langchain-hs-core-0.0.6.0-r0-bee7d2d3bffd1d28f506c07506b25224d171696bdae7fbca81a140befe042a38.nix;
        revNum = 0;
        sha256 = "bee7d2d3bffd1d28f506c07506b25224d171696bdae7fbca81a140befe042a38";
      };
      r1 = {
        nix = import ../hackage/langchain-hs-core-0.0.6.0-r1-c1b3e5a7b3092dc964f1495bf4b2e018ce26d4ac3c74b7ac8d3a4767013e43b4.nix;
        revNum = 1;
        sha256 = "c1b3e5a7b3092dc964f1495bf4b2e018ce26d4ac3c74b7ac8d3a4767013e43b4";
      };
      r2 = {
        nix = import ../hackage/langchain-hs-core-0.0.6.0-r2-583f380ccd6b28e9e857f5cb1f2764e8007a7571f5ec3e0650ad8834ea0883ca.nix;
        revNum = 2;
        sha256 = "583f380ccd6b28e9e857f5cb1f2764e8007a7571f5ec3e0650ad8834ea0883ca";
      };
      default = "r2";
    };
  };
}