# === Class: nexus::service
#
# This class is called from nexus for service.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::service {
  file { '/etc/systemd/system/nexus.service':
    ensure  => 'file',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => epp('nexus/nexus.service.epp'),
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
