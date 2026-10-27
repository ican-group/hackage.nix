{
  "1.2" = {
    sha256 = "ed265ac1645e4e67fc4621af793c48a2aefe8e81db5b6190ff5e2b0d83d0c4d8";
    revisions = {
      r0 = {
        nix = import ../hackage/libmagic-1.2-r0-a590d75b23babb7255b6a92ffed38bf53c0f7d917d5ed9d6bf7e31a956b0b5d5.nix;
        revNum = 0;
        sha256 = "a590d75b23babb7255b6a92ffed38bf53c0f7d917d5ed9d6bf7e31a956b0b5d5";
      };
      default = "r0";
    };
  };
  "1.3" = {
    sha256 = "9249ddd315a6533c94837588e07f0fab771b624af832472fad273017563f4d85";
    revisions = {
      r0 = {
        nix = import ../hackage/libmagic-1.3-r0-387c2cd337fd62f72dd3173c2203b9abfc8ca2eab44237f14f93eba3e0cbf6a5.nix;
        revNum = 0;
        sha256 = "387c2cd337fd62f72dd3173c2203b9abfc8ca2eab44237f14f93eba3e0cbf6a5";
      };
      default = "r0";
    };
  };
}