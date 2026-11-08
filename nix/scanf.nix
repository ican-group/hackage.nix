{
  "0.1.0.0" = {
    sha256 = "5675132f172ab4ed460f440df21e203c09457c2fff34fb6a389129a9da78c375";
    revisions = {
      r0 = {
        nix = import ../hackage/scanf-0.1.0.0-r0-a4d760fc31120be424a3527553336679493882d7fac78c148cb8797a67c35f36.nix;
        revNum = 0;
        sha256 = "a4d760fc31120be424a3527553336679493882d7fac78c148cb8797a67c35f36";
      };
      r1 = {
        nix = import ../hackage/scanf-0.1.0.0-r1-664b846d3529dcd8563d760badde9845d0e6db22d9adc2e287c851715d3ef254.nix;
        revNum = 1;
        sha256 = "664b846d3529dcd8563d760badde9845d0e6db22d9adc2e287c851715d3ef254";
      };
      default = "r1";
    };
  };
  "0.2.0.0" = {
    sha256 = "8482b144cbd14bf1b04df0b7e5bb57f2b0a0da6dc8909a5f598af3709913f19b";
    revisions = {
      r0 = {
        nix = import ../hackage/scanf-0.2.0.0-r0-fafe7cf26d77d24c4cc4e71cfe95936f6d4cad3ccaf47e000c6770bf8d819a6f.nix;
        revNum = 0;
        sha256 = "fafe7cf26d77d24c4cc4e71cfe95936f6d4cad3ccaf47e000c6770bf8d819a6f";
      };
      default = "r0";
    };
  };
}