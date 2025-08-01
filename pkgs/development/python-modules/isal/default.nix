{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,

  # build-system
  setuptools,
  versioningit,

  # native dependencies
  isa-l,

  # tests
  pytest-timeout,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "isal";
  version = "1.7.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pycompression";
    repo = "python-isal";
    rev = "v${version}";
    hash = "sha256-gvUVSGarPA4KupQTd61x75CfqNVqZfFC1zq0R21Clf8=";
  };

  patches = [
    (replaceVars ./version.patch {
      inherit version;
    })
  ];

  build-system = [
    setuptools
    versioningit
  ];

  buildInputs = [ isa-l ];

  env.PYTHON_ISAL_LINK_DYNAMIC = true;

  nativeCheckInputs = [
    pytest-timeout
    pytestCheckHook
  ];

  enabledTestPaths = [ "tests" ];

  disabledTests = [
    # calls `python -m isal` and fails on import
    "test_compress_fast_best_are_exclusive"
    "test_compress_infile_outfile"
    "test_compress_infile_outfile_default"
    "test_decompress_cannot_have_flags_compression"
    "test_decompress_infile_outfile_error"
  ];

  pythonImportsCheck = [ "isal" ];

  meta = with lib; {
    changelog = "https://github.com/pycompression/python-isal/blob/${src.rev}/CHANGELOG.rst";
    description = "Faster zlib and gzip compatible compression and decompression by providing python bindings for the isa-l library";
    homepage = "https://github.com/pycompression/python-isal";
    license = licenses.psfl;
    maintainers = with maintainers; [ hexa ];
  };
}
