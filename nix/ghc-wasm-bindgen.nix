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
  "0.2.0.0" = {
    sha256 = "ed4543fc8974bc1ca593fe27e758d35023c266a547ca1ba7f631facb14ca7d06";
    revisions = {
      r0 = {
        nix = import ../hackage/ghc-wasm-bindgen-0.2.0.0-r0-a0c8b73f35b9df8f3320a2015619a534181e2617a182403a49fe5d3f8f903c63.nix;
        revNum = 0;
        sha256 = "a0c8b73f35b9df8f3320a2015619a534181e2617a182403a49fe5d3f8f903c63";
      };
      default = "r0";
    };
  };
  "0.3.0.0" = {
    sha256 = "94b6d0d62b82b5162fc7c1a86e27b49abaa7ca80534994839df321f6e0fb4247";
    revisions = {
      r0 = {
        nix = import ../hackage/ghc-wasm-bindgen-0.3.0.0-r0-36ef7273a58fc82c3082418dc3f01710bdf66bb48d95c042233d340b3f5920c3.nix;
        revNum = 0;
        sha256 = "36ef7273a58fc82c3082418dc3f01710bdf66bb48d95c042233d340b3f5920c3";
      };
      default = "r0";
    };
  };
}