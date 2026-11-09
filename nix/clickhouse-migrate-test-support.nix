{
  "0.1.0.0" = {
    sha256 = "917f7165f9792eae771a02db4ac80befb0d03fa8a985ae224a365d116f00d7bd";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-test-support-0.1.0.0-r0-0c741f47d8900aa5e4e179180a327aa877bb7bb188baa4d709eb83b8a703a721.nix;
        revNum = 0;
        sha256 = "0c741f47d8900aa5e4e179180a327aa877bb7bb188baa4d709eb83b8a703a721";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "4c7e1b08a7e0b80a6fbb02e8d7216558a785f1695a46eb0026081f946540cb0c";
    revisions = {
      r0 = {
        nix = import ../hackage/clickhouse-migrate-test-support-0.2.0.0-r0-3c4d55505c81b199e9d5e4ce4f08f139bfc65c8b4a4c9e57e2066dc74d89d94b.nix;
        revNum = 0;
        sha256 = "3c4d55505c81b199e9d5e4ce4f08f139bfc65c8b4a4c9e57e2066dc74d89d94b";
      };
      default = "r0";
    };
  };
}