{
  "0.1.0.0" = {
    sha256 = "73e5ebcc17e3f75f79748e6e23205340f2d38d2be4d6f782a07a0ddce9e0166b";
    revisions = {
      r0 = {
        nix = import ../hackage/mischief-ecs-0.1.0.0-r0-ff88775b58aeb96d6a493271a8c0cbeb022d191098253ed0343d96385d6c340c.nix;
        revNum = 0;
        sha256 = "ff88775b58aeb96d6a493271a8c0cbeb022d191098253ed0343d96385d6c340c";
      };
      r1 = {
        nix = import ../hackage/mischief-ecs-0.1.0.0-r1-ab2e8025864f218c08496ceb47c3730ce63d805de6db19d0b39c2887cebdc24d.nix;
        revNum = 1;
        sha256 = "ab2e8025864f218c08496ceb47c3730ce63d805de6db19d0b39c2887cebdc24d";
      };
      r2 = {
        nix = import ../hackage/mischief-ecs-0.1.0.0-r2-7ab656fd77fbd48dc6c2014ca7fc0d465b6480ab39c7af6069742cd6fe9471ed.nix;
        revNum = 2;
        sha256 = "7ab656fd77fbd48dc6c2014ca7fc0d465b6480ab39c7af6069742cd6fe9471ed";
      };
      default = "r2";
    };
  };
  "0.2.0.0" = {
    sha256 = "447548aeca0be3b02e601a9a82cd77e9b70dbc870952e5fecc285e49b71cbdb8";
    revisions = {
      r0 = {
        nix = import ../hackage/mischief-ecs-0.2.0.0-r0-053e061826e77662a15e869c0101a5fc80b042bc3f38b8a31a9687cff293f2e3.nix;
        revNum = 0;
        sha256 = "053e061826e77662a15e869c0101a5fc80b042bc3f38b8a31a9687cff293f2e3";
      };
      default = "r0";
    };
  };
  "0.2.1.0" = {
    sha256 = "ded7fc79dd34db9b5d91d0612fb10ea037b43f8fd98b23647835c7754b9fc237";
    revisions = {
      r0 = {
        nix = import ../hackage/mischief-ecs-0.2.1.0-r0-f516bcfba9d5376c8c9e2a4e346d71e7bb94fd83682b020afd686662a3b20fa6.nix;
        revNum = 0;
        sha256 = "f516bcfba9d5376c8c9e2a4e346d71e7bb94fd83682b020afd686662a3b20fa6";
      };
      default = "r0";
    };
  };
}