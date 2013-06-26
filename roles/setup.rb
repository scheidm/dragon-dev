name "setup"
description "test setup of box"
run_list [
  'recipe[build-essential]',
  'recipe[apt]',
  'recipe[git]',
  'recipe[openssl]',
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
    password: {
      postgres: '9678fd32f829d44e4eb45b0916b5adbc'
    }
  }
