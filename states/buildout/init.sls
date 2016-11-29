
# Configuration for environment which uses zc.buildout version 1.6.3

include:
  - python

buildout-packages:
  pkg.installed:
    - names:
      - librabbitmq-dev
      - python-imaging
      - python-lxml
      - python-psycopg2

buildout-pip-packages:
  pip.installed:
    - names:
      - zc.buildout == 1.6.3
      - gunicorn == 18.0
      - python-memcached == 1.58
      - librabbitmq == 1.6.1
    - require:
      - pkg: python-pip
      - pkg: buildout-packages

