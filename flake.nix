{
  description = "kbld";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forAllSystems ({ pkgs }: {
        default = pkgs.buildGo123Module rec {
          pname = "kbld";
          version = "0.45.1";
          subPackages = [ "cmd/kbld" ];
          src = pkgs.fetchFromGitHub {
            owner = "carvel-dev";
            repo = "kbld";
            rev = "refs/tags/v${version}";
            sha256 = "sha256-ikrxgukixnUCwwEt5FBzTmpjpjkjgtYTjr/AwNZ9kiI=";
          };
          vendorHash = null;
        };
      });
    };
}