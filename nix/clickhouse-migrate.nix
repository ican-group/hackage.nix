{
  "0.1.0.0" = {
    sha256 = "e57311e6b42cfb05178e5754f4146b611acf3c9a4c880d0a6e5d41649cab8ec4";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-0.1.0.0-r0-27c55c76c68d47abc44db73d3c4ba39c75798ebde518889fe738b0cf2b18123f.nix;
        revNum = 0;
        sha256 = "27c55c76c68d47abc44db73d3c4ba39c75798ebde518889fe738b0cf2b18123f";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "1c0eb282ac85f4b862ce5e6c6518a084fdfcdbe9300c2eaf443236fa01ce4bec";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-0.2.0.0-r0-bc882578f2d595e9bce92e012274484fd50d8dc88729e040f58041884848d692.nix;
        revNum = 0;
        sha256 = "bc882578f2d595e9bce92e012274484fd50d8dc88729e040f58041884848d692";
      };
      default = "r0";
    };
  };
}