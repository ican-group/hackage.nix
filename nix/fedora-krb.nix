{
  "0.1.0" = {
    sha256 = "1110389daf57bfc33d593961e9898210e0395814ff93688b03f2ba32230c92cb";
    revisions = {
      r0 = {
        nix = import ../hackage/fedora-krb-0.1.0-r0-30087c5ad1e12ba8eb6fc881716289d6eab975c5b93d81910d2731c12b98a384.nix;
        revNum = 0;
        sha256 = "30087c5ad1e12ba8eb6fc881716289d6eab975c5b93d81910d2731c12b98a384";
      };
      default = "r0";
    };
  };
  "0.1.1" = {
    sha256 = "92ab05b771a7f628cadf953d66f6901f098025856a062cbe9a3fa4415fe4913f";
    revisions = {
      r0 = {
        nix = import ../hackage/fedora-krb-0.1.1-r0-28f46e1c66e97a3a5ae4ac9e5f151ec75f03197954b693c1cfa35702be9a4f90.nix;
        revNum = 0;
        sha256 = "28f46e1c66e97a3a5ae4ac9e5f151ec75f03197954b693c1cfa35702be9a4f90";
      };
      default = "r0";
    };
  };
}