{
  "0.1.0.0" = {
    sha256 = "fa221e0218503e8fbb447dc0ed405e43f13c5040055084cc0cb6ca6501a7f127";
    revisions = {
      r0 = {
        nix = import ../hackage/template-haskell-lift-0.1.0.0-r0-67d4731ce3ff612dfd3b62a5e6c323640e97ccf5cbd367135813cc2f764794f2.nix;
        revNum = 0;
        sha256 = "67d4731ce3ff612dfd3b62a5e6c323640e97ccf5cbd367135813cc2f764794f2";
      };
      r1 = {
        nix = import ../hackage/template-haskell-lift-0.1.0.0-r1-f6cd3ee45b0c68480c400bfca9f08f39e8e87a5eb823f206dbe06ab1923a4f1c.nix;
        revNum = 1;
        sha256 = "f6cd3ee45b0c68480c400bfca9f08f39e8e87a5eb823f206dbe06ab1923a4f1c";
      };
      r2 = {
        nix = import ../hackage/template-haskell-lift-0.1.0.0-r2-1f9a7562e897f85c7c2b420a1faddb93f62c0b4233f8223cc40e3f6e1af34fd9.nix;
        revNum = 2;
        sha256 = "1f9a7562e897f85c7c2b420a1faddb93f62c0b4233f8223cc40e3f6e1af34fd9";
      };
      r3 = {
        nix = import ../hackage/template-haskell-lift-0.1.0.0-r3-ac6b27823aeac34a3b5b06a730faa5c8e2482250ce1fd5d2c9740decd8c0a823.nix;
        revNum = 3;
        sha256 = "ac6b27823aeac34a3b5b06a730faa5c8e2482250ce1fd5d2c9740decd8c0a823";
      };
      default = "r3";
    };
  };
}