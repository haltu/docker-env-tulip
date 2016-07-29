
# Configuration for environment which uses zc.buildout version 1.6.3

include:
  - python

buildout-packages:
  pkg.installed:
    - names:
      - python-psycopg2
      - python-imaging
      - python-lxml

buildout-pip-packages:
  pip.installed:
    - names:
      - zc.buildout == 1.6.3
      - gunicorn == 18.0
      - python-memcached == 1.58
    - require:
      - pkg: python-pip

