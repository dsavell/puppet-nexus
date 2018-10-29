# === Class: nexus::config
#
# This class is called from nexus for configuration.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::config {
  group { $nexus::user:
    ensure => 'present',
  }

  user { $nexus::user:
    ensure => 'present',
    system => true,
  }

  file { "${nexus::install_path}/sonatype-work":
    ensure  => directory,
    owner   => $nexus::user,
    group   => $nexus::user,
    recurse => true,
  }

  file { "${nexus::install_path}/nexus":
    ensure => 'link',
    target => "${nexus::install_path}/nexus-${nexus::version}",
  }

  file_line { 'nexus_service_user':
    path  => "${nexus::install_path}/nexus/bin/nexus.rc",
    line  => "run_as_user=\"${nexus::user}\"",
    match => '^#run_as_user=""',
  }
}
