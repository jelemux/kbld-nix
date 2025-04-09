{ pkgs }:

pkgs.buildGo123Module rec {
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

  meta = {
    description = "Image solver for immutable image references";
    homepage = "https://carvel.dev/kbld/";
    mainProgram = "kbld";
  };
}