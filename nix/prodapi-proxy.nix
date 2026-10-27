{
  "0.1.0.0" = {
    sha256 = "75dd82a54c612cb197cde3b5d35f6dba0700c0b0df920be215aab7b9b9dbf093";
    revisions = {
      r0 = {
        nix = import ../hackage/prodapi-proxy-0.1.0.0-r0-20164b90c57bfc99671f0751da59b96619de532633ff09e9cc1c946ee56abd8d.nix;
        revNum = 0;
        sha256 = "20164b90c57bfc99671f0751da59b96619de532633ff09e9cc1c946ee56abd8d";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "e0274850e81801d268fa18d4a5256dd15c782f1bf6838bc82a1fd2611673cc12";
    revisions = {
      r0 = {
        nix = import ../hackage/prodapi-proxy-0.2.0.0-r0-5251c8f7f80d4740a109167fec1239caa72023289eb38b6fa144886177ce600e.nix;
        revNum = 0;
        sha256 = "5251c8f7f80d4740a109167fec1239caa72023289eb38b6fa144886177ce600e";
      };
      r1 = {
        nix = import ../hackage/prodapi-proxy-0.2.0.0-r1-1731247f7d7be5e25ffa0c0116f9eb431915d924fb7e58fd5979984c5d8f4465.nix;
        revNum = 1;
        sha256 = "1731247f7d7be5e25ffa0c0116f9eb431915d924fb7e58fd5979984c5d8f4465";
      };
      default = "r1";
    };
  };
}