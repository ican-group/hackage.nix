{
  "1" = {
    sha256 = "6b06ec3f14102653711ba9434b91235db7d60ff1c0f339d1e7834eba33144959";
    revisions = {
      r0 = {
        nix = import ../hackage/nix-paths-1-r0-448cc2d2712663549f8c86cb60ef9257bea9644a10922148b3c23a3fe93f6a38.nix;
        revNum = 0;
        sha256 = "448cc2d2712663549f8c86cb60ef9257bea9644a10922148b3c23a3fe93f6a38";
      };
      r1 = {
        nix = import ../hackage/nix-paths-1-r1-f8cff48213a8b9c1fe0aabbc7a607da4f1253d6ddbaa6d83791cccde7c44ad18.nix;
        revNum = 1;
        sha256 = "f8cff48213a8b9c1fe0aabbc7a607da4f1253d6ddbaa6d83791cccde7c44ad18";
      };
      default = "r1";
    };
  };
  "1.0.0.1" = {
    sha256 = "742da2042caa20d63690e9c6de632eebd71b863001eb2c71645f8c72d3e9f315";
    revisions = {
      r0 = {
        nix = import ../hackage/nix-paths-1.0.0.1-r0-70f6f55d99c436e83e549cdea538b90f1dba387a7e00d6dc0b1610e33473e9b1.nix;
        revNum = 0;
        sha256 = "70f6f55d99c436e83e549cdea538b90f1dba387a7e00d6dc0b1610e33473e9b1";
      };
      r1 = {
        nix = import ../hackage/nix-paths-1.0.0.1-r1-348e510f34ab00cfbdf336a862136e0f3f505eff05ccc963e574c6f655e9869e.nix;
        revNum = 1;
        sha256 = "348e510f34ab00cfbdf336a862136e0f3f505eff05ccc963e574c6f655e9869e";
      };
      default = "r1";
    };
  };
  "1.0.1" = {
    sha256 = "ab37163bc2970ea16c2eb6e091d1e99ab50b8e2ba93c23d24dac761803e509f8";
    revisions = {
      r0 = {
        nix = import ../hackage/nix-paths-1.0.1-r0-88aebeb99b314d463134300ecb052cdf9e3580dceb376793b011ac4aa4dfbfb8.nix;
        revNum = 0;
        sha256 = "88aebeb99b314d463134300ecb052cdf9e3580dceb376793b011ac4aa4dfbfb8";
      };
      default = "r0";
    };
  };
  "1.0.2" = {
    sha256 = "fb7acc57fdef2ccf420123d504f40d7b9172b6a18c1be9c36c5376d569959ab1";
    revisions = {
      r0 = {
        nix = import ../hackage/nix-paths-1.0.2-r0-b138a0841d1e7c0fa48ca89dc75201db3d541d5046d2de1a4f99923f463a1c7c.nix;
        revNum = 0;
        sha256 = "b138a0841d1e7c0fa48ca89dc75201db3d541d5046d2de1a4f99923f463a1c7c";
      };
      default = "r0";
    };
  };
}