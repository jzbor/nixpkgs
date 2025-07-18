{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  cloudpickle,
  ipykernel,
  ipython,
  jupyter-client,
  pyxdg,
  pyzmq,
  wurlitzer,
}:

buildPythonPackage rec {
  pname = "spyder-kernels";
  version = "3.1.0a2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "spyder-ide";
    repo = "spyder-kernels";
    tag = "v${version}";
    hash = "sha256-3P4id66b/URu1iNgLr0TWUz0xToqslhdIw52QCMbsMI=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "ipython"
  ];

  dependencies = [
    cloudpickle
    ipykernel
    ipython
    jupyter-client
    pyxdg
    pyzmq
    wurlitzer
  ];

  # No tests
  doCheck = false;

  pythonImportsCheck = [ "spyder_kernels" ];

  meta = {
    description = "Jupyter kernels for Spyder's console";
    homepage = "https://docs.spyder-ide.org/current/ipythonconsole.html";
    downloadPage = "https://github.com/spyder-ide/spyder-kernels/releases";
    changelog = "https://github.com/spyder-ide/spyder-kernels/blob/v${version}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
