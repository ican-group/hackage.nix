{
  "1.1.1" = {
    sha256 = "c13ab5cd82662878def2fb6e443d345ebce6e4c7cf45beb89a5160185e49160c";
    revisions = {
      r0 = {
        nix = import ../hackage/LPFP-core-1.1.1-r0-a3aaa2bac03e50fd2c9837ed45df037c1dfd94c5fe66ebab479932c27cf82606.nix;
        revNum = 0;
        sha256 = "a3aaa2bac03e50fd2c9837ed45df037c1dfd94c5fe66ebab479932c27cf82606";
      };
      r1 = {
        nix = import ../hackage/LPFP-core-1.1.1-r1-1f0aac0efd125abb6d1470071793ab5818aed29d2db431868e39b8ab8a69b6ff.nix;
        revNum = 1;
        sha256 = "1f0aac0efd125abb6d1470071793ab5818aed29d2db431868e39b8ab8a69b6ff";
      };
      default = "r1";
    };
  };
  "1.1.5" = {
    sha256 = "3b87703016434c1bea2d1a4613cb9a1d45762ef6a61a44811c19f09d5669eee3";
    revisions = {
      r0 = {
        nix = import ../hackage/LPFP-core-1.1.5-r0-de8eaa8535b48375f7536d2ea9f5da2ecf5f3e6e0c4e9de318663e1582a1a47e.nix;
        revNum = 0;
        sha256 = "de8eaa8535b48375f7536d2ea9f5da2ecf5f3e6e0c4e9de318663e1582a1a47e";
      };
      r1 = {
        nix = import ../hackage/LPFP-core-1.1.5-r1-39e5ed63e15a2062e52353c2e2a8d2c0df3149e7cb23d1bf493653d7f4b12fee.nix;
        revNum = 1;
        sha256 = "39e5ed63e15a2062e52353c2e2a8d2c0df3149e7cb23d1bf493653d7f4b12fee";
      };
      default = "r1";
    };
  };
}