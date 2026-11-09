{
  "0.1.0.0" = {
    sha256 = "85852797b0094b0635a9082491e6c1a78d426f392cc3376292e867cc076e6747";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-cli-0.1.0.0-r0-58e8ffeba554d3327068eb3c7078a980358c6b5376d0513fc43d667f24d91366.nix;
        revNum = 0;
        sha256 = "58e8ffeba554d3327068eb3c7078a980358c6b5376d0513fc43d667f24d91366";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "bd618053e8d8eff2eebc9d13622960bb3778e32d86bdb200223499fabe67953a";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-cli-0.2.0.0-r0-dd42e6714cab9499a892e126ccd3568a4288bb6e4afb341508733eac89e3299a.nix;
        revNum = 0;
        sha256 = "dd42e6714cab9499a892e126ccd3568a4288bb6e4afb341508733eac89e3299a";
      };
      default = "r0";
    };
  };
}