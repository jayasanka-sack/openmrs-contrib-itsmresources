class profiles::transifex (
  $transifex_token,
){
  package { ['libffi-dev']:
    ensure  => present,
  } ->
  package { 'cryptography':
    ensure   => '3.0',
    provider => 'pip3',
  } ->
  package { 'pyOpenSSL':
    ensure   => '17.5.0',
    provider => 'pip3',
  } ->
  package { 'transifex-client':
    ensure  => '0.12.5',
    provider => 'pip3',
  }
  bamboo_agent_home::file { '.transifexrc':
    content => template('profiles/transifex/dot-transifexrc.erb'),
  }
}
