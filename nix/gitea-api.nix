{
  "1.19.4.0" = {
    sha256 = "e6ebc31f8b6dfafc2f4841d1a144c711ea13c5a9a68edb3098363c6506e3918d";
    revisions = {
      r0 = {
        nix = import ../hackage/gitea-api-1.19.4.0-r0-c08ec2dc3361604024cda43825b2dc0b810ef946cdd046dc6617afc413c1a65e.nix;
        revNum = 0;
        sha256 = "c08ec2dc3361604024cda43825b2dc0b810ef946cdd046dc6617afc413c1a65e";
      };
      default = "r0";
    };
  };
  "1.20.6.0" = {
    sha256 = "928468ccda2dda4a6bfbf337953228135a1a07a543f1afb5fe2c5d79a48107e1";
    revisions = {
      r0 = {
        nix = import ../hackage/gitea-api-1.20.6.0-r0-bfc97228c2a60611dd3ab0386004c1d53d918fef0f624fc90275b5ab7aa0df94.nix;
        revNum = 0;
        sha256 = "bfc97228c2a60611dd3ab0386004c1d53d918fef0f624fc90275b5ab7aa0df94";
      };
      default = "r0";
    };
  };
  "1.21.11.0" = {
    sha256 = "0cf0adfc48f2a0ce3fecea83d29fb7be35966ad765ffbdb9a2e6944041ed10d5";
    revisions = {
      r0 = {
        nix = import ../hackage/gitea-api-1.21.11.0-r0-eb409429412e8ea3424c9b2a7143044a247dddc746440f44ccecd3ea27e3af3d.nix;
        revNum = 0;
        sha256 = "eb409429412e8ea3424c9b2a7143044a247dddc746440f44ccecd3ea27e3af3d";
      };
      default = "r0";
    };
  };
  "1.22.6.0" = {
    sha256 = "473861f1b7c6670bd88594c5377a54b95144c00c24d6840d1abe0caa03e45ff0";
    revisions = {
      r0 = {
        nix = import ../hackage/gitea-api-1.22.6.0-r0-00e803775138dc34d03341272a73339262de4c23e0639878c53edb2b78e51822.nix;
        revNum = 0;
        sha256 = "00e803775138dc34d03341272a73339262de4c23e0639878c53edb2b78e51822";
      };
      default = "r0";
    };
  };
  "1.23.1.0" = {
    sha256 = "06f1a49e060537c433fcbd804e1242c0d9050ef8d2141917557f0348acd2d110";
    revisions = {
      r0 = {
        nix = import ../hackage/gitea-api-1.23.1.0-r0-69b7e105dd65630ca6ce8e7bd1a860f7841b1593a7ab454d7bb8238b1ab1070a.nix;
        revNum = 0;
        sha256 = "69b7e105dd65630ca6ce8e7bd1a860f7841b1593a7ab454d7bb8238b1ab1070a";
      };
      r1 = {
        nix = import ../hackage/gitea-api-1.23.1.0-r1-ccccc7327d61fe83e2642e26aecc41b9073b81e16b240e20e36f31294cef5ff8.nix;
        revNum = 1;
        sha256 = "ccccc7327d61fe83e2642e26aecc41b9073b81e16b240e20e36f31294cef5ff8";
      };
      default = "r1";
    };
  };
}