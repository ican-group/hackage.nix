{
  "0.7.7.0" = {
    sha256 = "09c07a6130121f3622d91af0d33432189132c7b801aa62ece2449616183e53e3";
    revisions = {
      r0 = {
        nix = import ../hackage/Vis-0.7.7.0-r0-03054deb5d6d658f80b03d7671561fc5c3179df808fe0b2a04fed43ba7d6bb05.nix;
        revNum = 0;
        sha256 = "03054deb5d6d658f80b03d7671561fc5c3179df808fe0b2a04fed43ba7d6bb05";
      };
      r1 = {
        nix = import ../hackage/Vis-0.7.7.0-r1-677e4bf8410eaa5cf467c2db9f4e57c3c41533d6f212eceaa6cafd65cb790cdd.nix;
        revNum = 1;
        sha256 = "677e4bf8410eaa5cf467c2db9f4e57c3c41533d6f212eceaa6cafd65cb790cdd";
      };
      r2 = {
        nix = import ../hackage/Vis-0.7.7.0-r2-b52217fc1e7ab330aba80d124f90f6ba7781561437e6a982982c7f2d3006f946.nix;
        revNum = 2;
        sha256 = "b52217fc1e7ab330aba80d124f90f6ba7781561437e6a982982c7f2d3006f946";
      };
      default = "r2";
    };
  };
  "0.7.7.1" = {
    sha256 = "27dff3dd82da71de40ac40dfb4e0c9054f4a7910e4996e297cd9adc9fc7fa2da";
    revisions = {
      r0 = {
        nix = import ../hackage/Vis-0.7.7.1-r0-c6673bccdee73929a0f698e285885d1e38dc1f2edc2ebb3cf7d648acf13c0d5c.nix;
        revNum = 0;
        sha256 = "c6673bccdee73929a0f698e285885d1e38dc1f2edc2ebb3cf7d648acf13c0d5c";
      };
      default = "r0";
    };
  };
  "1.0.0" = {
    sha256 = "53df79ef260205c19d6f5b30cd1336b7c60d0b04de7ca38df570be1726aa93a9";
    revisions = {
      r0 = {
        nix = import ../hackage/Vis-1.0.0-r0-7d88c75db3844a293d04f5f2d0a71bb9cd5cbeca7449cb742fd511275dc87018.nix;
        revNum = 0;
        sha256 = "7d88c75db3844a293d04f5f2d0a71bb9cd5cbeca7449cb742fd511275dc87018";
      };
      r1 = {
        nix = import ../hackage/Vis-1.0.0-r1-b574d18ca313c5c14776b0a960ea0848c9f838e8d2632d95c4cedb3abb6384d2.nix;
        revNum = 1;
        sha256 = "b574d18ca313c5c14776b0a960ea0848c9f838e8d2632d95c4cedb3abb6384d2";
      };
      r2 = {
        nix = import ../hackage/Vis-1.0.0-r2-e55cf2692ccb1ee9060fde3f87e46653a9730f04d342b4e6eaca8e81a79e7585.nix;
        revNum = 2;
        sha256 = "e55cf2692ccb1ee9060fde3f87e46653a9730f04d342b4e6eaca8e81a79e7585";
      };
      default = "r2";
    };
  };
}