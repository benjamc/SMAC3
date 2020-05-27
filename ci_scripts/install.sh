#!/usr/bin/env bash

if [[ "$PYTHON_VERSION" == "pypy_conda" ]]; then

    # mypy doesn't work with pypy (yet)
    pip install pep8 codecov flake8 pytest-cov
    # no-cache-dir for pyrfr because wheel needs to be built with a newer swig
    pypy -m pip install --no-cache-dir pyrfr>=0.8.0
    # numpy conda install because BLAS missing in travis
    conda install numpy scipy

else

    pip install pep8 codecov mypy flake8 pytest-cov

fi

cat requirements.txt | xargs -n 1 -L 1 pip install
pip install .[all]
