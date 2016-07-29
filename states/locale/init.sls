
# Harmonizes the locale settings.
# Installs language packs and Generates locale files for UTF-8


/etc/default/locale:
  file.managed:
    - source: salt://locale/etc_default_locale

/etc/locale.gen:
  file.managed:
    - source: salt://locale/locale.gen
    - user: root
    - group: root
    - mode: 644

locale-gen:
  cmd.wait:
    - watch:
      - file: /etc/locale.gen
    - require:
      - pkg: locale-essential-packages

locale-essential-packages:
  pkg.installed:
    - names:
      - language-pack-en

