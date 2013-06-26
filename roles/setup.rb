name "setup"
description "test setup of box"
run_list [
  'recipe[build-essential]',
  'recipe[apt]',
  'recipe[git]',
  'recipe[openssl]',
  'recipe[postgresql::apt_pgdg_postgresql]',
  'recipe[postgresql]',
  'recipe[base]'
]
default_attributes \
  postgresql: {
    username: 'bitbox',
    superuser: true,
    createdb: true,
    login: true,
    pg_hba: [
      {type: 'local', db: 'all', user: 'all', addr: nil, method: 'trust'}
    ],
    version: '9.2',
    server: { packages: ["postgresql-9.2", "postgresql-server-dev-9.2", "postgresql-contrib-9.2"] },
    enable_pgdg_apt: true,
    password: {
      postgres: '9678fd32f829d44e4eb45b0916b5adbc'
    },
  postgis:{}
  }
