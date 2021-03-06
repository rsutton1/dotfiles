{% set user = salt.environ.get("SUDO_USER") %}
{% set nvim_path = "/usr/local/nvim" %}
include:
 - node.archive
 - saltlsp

neovim_build_deps:
  pkg.installed:
    - pkgs:
      - ninja-build
      - gettext
      - libtool
      - libtool-bin
      - autoconf
      - automake
      - cmake
      - g++
      - pkg-config
      - unzip
      - curl
      - doxygen
    - prereq:
      - cmd: neovim_installed

neovim_downloaded:
  archive.extracted:
    - name: /tmp/
    - trim_output: 0
    - source: https://github.com/neovim/neovim/archive/refs/tags/v0.7.0.tar.gz
    - source_hash: 792a9c55d5d5f4a5148d475847267df309d65fb20f05523f21c1319ea8a6c7df
    - hide_output: True
    - prereq:
      - cmd: neovim_installed

nvim_dir:
  file.directory:
    - name: {{ nvim_path }}/bin
    - makedirs: True
    - prereq:
      - neovim_installed

neovim_installed:
  cmd.run:
    - name: |
        cd /tmp/neovim-0.7.0
        make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX={{ nvim_path }}"
        make install
    - hide_output: True
    - unless: {{ nvim_path }}/bin/nvim --version | grep 0.7.0

neovim_ag_installed:
  pkg.installed:
    - pkgs:
      - silversearcher-ag

neovim_plugins_vimplug:
  cmd.run:
    - name: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - runas: {{ user }}
    - require:
      - neovim_installed
      - node-archive-install-file-symlink-node # for coc
      - neovim_ag_installed
      - salt_lsp

neovim_plugins_installed:
  cmd.run:
    - name: {{ nvim_path }}/bin/nvim --headless +PlugInstall +qa
    - runas: {{ user }}
    - require:
      - neovim_plugins_vimplug
