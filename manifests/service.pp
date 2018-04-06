# === Class: nexus::service
#
# This class is called from nexus for service.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::service {

  $custom_path  = $::nexus::custom_path
  $user         = $::nexus::user

  file { '/etc/systemd/system/nexus.service':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('nexus/nexus.service.erb'),
  }

  exec { 'systemd-reload':
    command     => 'systemctl daemon-reload',
    path        => [
      '/bin',
      '/usr/bin',
      '/usr/sbin',
    ],
    refreshonly => true,
  }

  service { 'nexus':
    ensure => 'running',
    enable => true,
  }

}
