name "postgres"
description "Installs Postgres 9.2"
run_list [
  'recipe[build-essential]',
  'recipe[apt]',
  'recipe[openssl]',
  'recipe[base]',
  'recipe[postgresql::server]',
  'recipe[base::postgis]'
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
