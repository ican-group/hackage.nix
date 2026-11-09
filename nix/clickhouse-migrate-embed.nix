{
  "0.1.0.0" = {
    sha256 = "ac869207abf920c646b0fd3cd6c70ee0e3b38b38592fce6539a474ced31cd355";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-embed-0.1.0.0-r0-737118d3b8952aeebd08aed83b6c08b56c844c37424a29b50581c804249e3f00.nix;
        revNum = 0;
        sha256 = "737118d3b8952aeebd08aed83b6c08b56c844c37424a29b50581c804249e3f00";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "428265ae4632e327ffc3f784873659b9dce4e1e4faa23afff2e9a9fbb85fb3e8";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-embed-0.2.0.0-r0-65fab95803347761759e184cb707e57cd56b61a84dd508e2b52ca9eadd683816.nix;
        revNum = 0;
        sha256 = "65fab95803347761759e184cb707e57cd56b61a84dd508e2b52ca9eadd683816";
      };
      default = "r0";
    };
  };
}