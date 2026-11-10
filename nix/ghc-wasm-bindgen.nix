{
  "0.1.0.0" = {
    sha256 = "fca6c04103517ea5126fc6fa8dbbf50297e51729f7192dd04f9cb50da4c29459";
    revisions = {
      r0 = {
        nix = import ../hackage/ghc-wasm-bindgen-0.1.0.0-r0-caf3423c981472aa69621bacaecc8bd2943da9f680b41e36c7fb8a3ce47dbbef.nix;
        revNum = 0;
        sha256 = "caf3423c981472aa69621bacaecc8bd2943da9f680b41e36c7fb8a3ce47dbbef";
      };
      r1 = {
        nix = import ../hackage/ghc-wasm-bindgen-0.1.0.0-r1-10467a32aef88d57f1801155a6ede96033e73d0c8c2cd72e7493bbe8ca674078.nix;
        revNum = 1;
        sha256 = "10467a32aef88d57f1801155a6ede96033e73d0c8c2cd72e7493bbe8ca674078";
      };
      default = "r1";
    };
  };
}