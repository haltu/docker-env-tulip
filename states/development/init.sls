
include:
  - locale
  - python
  - essentials

development-packages:
  pkg.installed:
    - names:
      - build-essential
      - python-dev
      - libffi-dev
      - libssl-dev
      - ipython
      - python-virtualenv
      - inotify-tools

development-pip-packages:
  pip.installed:
    - names:
      - bpython == 0.13.1
      - devpi-client == 2.0.3
      - tox == 1.8.1
      - sphinx == 1.2.3
      - fabric == 1.9.0
      - yolk == 0.4.3
      - pythonpy == 0.3.6
      - cookiecutter == 1.4.0
    - require:
      - pkg: python-pip
      - pkg: python-dev

