{
  "3.1.0" = {
    sha256 = "eccd0614b97a0ceac1315627509208ba9d695d957b0afe0f0ad0d7edaaae5b23";
    revisions = {
      r0 = {
        nix = import ../hackage/slackblocks-3.1.0-r0-6a6f9d93410c56fb8b9cca67b882587508236740632a052a16b3037e59094415.nix;
        revNum = 0;
        sha256 = "6a6f9d93410c56fb8b9cca67b882587508236740632a052a16b3037e59094415";
      };
      default = "r0";
    };
  };
  "3.2.0" = {
    sha256 = "eee318898120179b2f6c5675cf5ca0296c3ac728641d99bc982cbfddcde4e19c";
    revisions = {
      r0 = {
        nix = import ../hackage/slackblocks-3.2.0-r0-68f12296bbf48651db6e971bdbe606a546ecf81ae0e373d96574ed5ccbbfb405.nix;
        revNum = 0;
        sha256 = "68f12296bbf48651db6e971bdbe606a546ecf81ae0e373d96574ed5ccbbfb405";
      };
      default = "r0";
    };
  };
}