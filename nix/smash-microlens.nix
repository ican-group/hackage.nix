{
  "0.1.0.0" = {
    sha256 = "80c64c66dad61ab3cc9431ef931ab88c3cb8fc6f766a04c839076bf7f2ae9b98";
    revisions = {
      r0 = {
        nix = import ../hackage/smash-microlens-0.1.0.0-r0-5c9c9786700789f7928fd5e52acb6532b54dde8aba3a24bb34e5af3952c90fb5.nix;
        revNum = 0;
        sha256 = "5c9c9786700789f7928fd5e52acb6532b54dde8aba3a24bb34e5af3952c90fb5";
      };
      r1 = {
        nix = import ../hackage/smash-microlens-0.1.0.0-r1-9a010bbebaa0439c075134b37f7be31a2af98c166eaf401f258856d817011908.nix;
        revNum = 1;
        sha256 = "9a010bbebaa0439c075134b37f7be31a2af98c166eaf401f258856d817011908";
      };
      default = "r1";
    };
  };
  "0.1.0.2" = {
    sha256 = "398662a80f833c12e6634031715d1aa8578b24ccf3973b0dbf0ee91fb86ad765";
    revisions = {
      r0 = {
        nix = import ../hackage/smash-microlens-0.1.0.2-r0-1140585c7e9c52e3416a5a9a9f00843d2fe2ba034f44aadd6c21ff21a08a185c.nix;
        revNum = 0;
        sha256 = "1140585c7e9c52e3416a5a9a9f00843d2fe2ba034f44aadd6c21ff21a08a185c";
      };
      default = "r0";
    };
  };
  "0.2.0" = {
    sha256 = "f2d101172e6925b6c6deb269cb92bc06656f6e6826311616782bcdd924bfa88e";
    revisions = {
      r0 = {
        nix = import ../hackage/smash-microlens-0.2.0-r0-776a213b285fe6dc9fb1581de6bbb2c688b2aeca4d4b448dadfac1f7c152b8d3.nix;
        revNum = 0;
        sha256 = "776a213b285fe6dc9fb1581de6bbb2c688b2aeca4d4b448dadfac1f7c152b8d3";
      };
      default = "r0";
    };
  };
}