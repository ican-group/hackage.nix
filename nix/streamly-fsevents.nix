{
  "0.1.0" = {
    sha256 = "dc4224de1891a0217a293b11f790db9fc0d236748ff62332d60554d2cb854bb7";
    revisions = {
      r0 = {
        nix = import ../hackage/streamly-fsevents-0.1.0-r0-dbc0c6036dcc40c3862721d5c63eec6d5419108b2df8a36696cbec550738009c.nix;
        revNum = 0;
        sha256 = "dbc0c6036dcc40c3862721d5c63eec6d5419108b2df8a36696cbec550738009c";
      };
      default = "r0";
    };
  };
  "0.1.1" = {
    sha256 = "88231e45a17b981e692df282623d4c061ed98289c4b1b0b7b99aea847ed45f4c";
    revisions = {
      r0 = {
        nix = import ../hackage/streamly-fsevents-0.1.1-r0-37e97c49a34fa20a9a0e55da48bb2096868f176993b410b936dd9960bef30e98.nix;
        revNum = 0;
        sha256 = "37e97c49a34fa20a9a0e55da48bb2096868f176993b410b936dd9960bef30e98";
      };
      r1 = {
        nix = import ../hackage/streamly-fsevents-0.1.1-r1-b0941bf89e0ca5a10716ab69da52067b1b0b857020b3ce2fef6bf4ce9a79aaba.nix;
        revNum = 1;
        sha256 = "b0941bf89e0ca5a10716ab69da52067b1b0b857020b3ce2fef6bf4ce9a79aaba";
      };
      r2 = {
        nix = import ../hackage/streamly-fsevents-0.1.1-r2-89a03a875767ee8225f264d8820f6e45be8cddcc734410b4481ea7412ae98d22.nix;
        revNum = 2;
        sha256 = "89a03a875767ee8225f264d8820f6e45be8cddcc734410b4481ea7412ae98d22";
      };
      r3 = {
        nix = import ../hackage/streamly-fsevents-0.1.1-r3-cd09d4a7e1ecb2179e1c2908c750aefbc9ca82fa4b20da79fe47096566e2bf7b.nix;
        revNum = 3;
        sha256 = "cd09d4a7e1ecb2179e1c2908c750aefbc9ca82fa4b20da79fe47096566e2bf7b";
      };
      default = "r3";
    };
  };
}