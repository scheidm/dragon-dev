name "gui"
description "sets up a full linux environment with XFCE window manager"
run_list [
  'recipe[apt]',
  'recipe[openssl]',
  'recipe[base]',
  'recipe[base::config]',
  'recipe[base::gui]',
  'recipe[chef-vim-setup]'
]
default_attributes \
  postgresql: {
    username: 'postgres',
    superuser: true,
    createdb: true,
    login: true,
    version: 9.2,
    dir: '/etc/postgresql/9.2/main',
    password: {
      postgres: '9678fd32f829d44e4eb45b0916b5adbc'
    },
    ssl: false
  },
  postgis: {
    version: '2.0.3'
  },
  geos: {
    version: '3.3.8'
  },
  vim_setup: {
    use_vundle: true,
    bundle_install: true
  }
override_attributes \
  postgresql: {
    server: {
      packages: ['postgresql-9.2']
    },
    config: {
      ssl: 'off'
    }
  }
