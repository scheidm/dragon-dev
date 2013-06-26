name "setup"
description "test setup of box"
run_list [
  'recipe[apt]',
  'recipe[git]',
  'recipe[base]'
]
