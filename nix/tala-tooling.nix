{
  "0.1.0" = {
    sha256 = "6aa3280fe0df59531d5185c1fee4d90f148d87043230b8c4d9ab1e0591918f4c";
    revisions = {
      r0 = {
        nix = import ../hackage/tala-tooling-0.1.0-r0-4b5a5dd4308c26b26cdb6350444e75a6d880fb36f4a056e8ed0002f3616971dc.nix;
        revNum = 0;
        sha256 = "4b5a5dd4308c26b26cdb6350444e75a6d880fb36f4a056e8ed0002f3616971dc";
      };
      default = "r0";
    };
  };
  "0.2.0" = {
    sha256 = "9d1bb39c0ea82475c26f0096c4ed11df54475da7db8294e3cd723b3c1c02eab7";
    revisions = {
      r0 = {
        nix = import ../hackage/tala-tooling-0.2.0-r0-440168b55bd48b679470ae4f36fdd145484c281cd3d3273d7dc6df03cea15d40.nix;
        revNum = 0;
        sha256 = "440168b55bd48b679470ae4f36fdd145484c281cd3d3273d7dc6df03cea15d40";
      };
      default = "r0";
    };
  };
}