{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "gersemi";
  version = "0.20.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "BlankSpruce";
    repo = "gersemi";
    tag = version;
    hash = "sha256-6lBUP+xi0owlD33TLTOlaIFBcfWTnsniK/9cQdo/ND4=";
  };

  build-system = with python3Packages; [
    setuptools
  ];

  dependencies = with python3Packages; [
    appdirs
    colorama
    lark
    pyyaml
  ];

  meta = {
    description = "Formatter to make your CMake code the real treasure";
    homepage = "https://github.com/BlankSpruce/gersemi";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ xeals ];
    mainProgram = "gersemi";
  };
}
