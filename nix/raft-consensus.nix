{
  "0.1.0.0" = {
    sha256 = "88d80e67b6d44df25746eb31c03aba512b83c91a81c4ad4ecdcc683a08669b94";
    revisions = {
      r0 = {
        nix = import ../hackage/raft-consensus-0.1.0.0-r0-c3fd76592764dede7de670567aa8edd763e18c65c64ab3e1310705c066c7399f.nix;
        revNum = 0;
        sha256 = "c3fd76592764dede7de670567aa8edd763e18c65c64ab3e1310705c066c7399f";
      };
      default = "r0";
    };
  };
}