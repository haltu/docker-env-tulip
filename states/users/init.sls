admin-grp:
  group.present:
    - name: admin

adm-grp:
  group.present:
    - name: adm

foo:
  user.present:
    - fullname: foo
    - password: foo
    - shell: /bin/bash
    - home: /home/foo
    - groups:
      - adm
      - admin
      - sudo
      - foo
    - optional_groups:
      - services
    - require:
      - group: admin
      - group: foo

foo-group:
  group.present:
    - name: foo

/home/foo:
  file.directory:
    - user: foo
    - group: foo
    - dir_mode: 750
    - file_mode: 750
    - recurse:
      - user
      - group
      - mode
    - require:
      - user: foo
      - group: foo

/home/foo/.hgrc:
  file.managed:
    - source: salt://users/hgrc
    - user: foo
    - group: foo
    - mode: 644
    - template: jinja
    - context:
        username: {{ salt['pillar.get']('hgrc_username', 'foo') }}
    - require:
      - user: foo

/home/foo/.bashrc:
  file.managed:
    - source: salt://users/bashrc
    - user: foo
    - group: foo
    - mode: 644
    - template: jinja
    - require:
      - user: foo

foo-vim-config:
  hg.latest:
    - name: {{ salt['pillar.get']('vim_repo', 'https://bitbucket.org/derega/vimrc') }}
    - rev: tip
    - target: /home/foo/.vim
    - user: foo

foo-vimrc:
  file.symlink:
    - name: /home/foo/.vimrc
    - target: /home/foo/.vim/vimrc_template
    - user: foo
    - group: foo
    - require:
      - hg: foo-vim-config

