{
  "0.1.0" = {
    sha256 = "130885d3a04e7142dcf94cbf3bc8343cc34910e643bb9fef2cc961b08478c53b";
    revisions = {
      r0 = {
        nix = import ../hackage/forgejo-0.1.0-r0-6daa2d81b877079c9593de613f08b6a7315717f40c4793b229e26fe023fbb347.nix;
        revNum = 0;
        sha256 = "6daa2d81b877079c9593de613f08b6a7315717f40c4793b229e26fe023fbb347";
      };
      default = "r0";
    };
  };
  "0.2.0" = {
    sha256 = "52e26f718089ea47568531d2e2cf34d42c6d34868d4109e929e9ffc32057ac62";
    revisions = {
      r0 = {
        nix = import ../hackage/forgejo-0.2.0-r0-bea6d02f1dfb654c242985a760bac8dc83a27eed395299f60183f3df57985341.nix;
        revNum = 0;
        sha256 = "bea6d02f1dfb654c242985a760bac8dc83a27eed395299f60183f3df57985341";
      };
      default = "r0";
    };
  };
}