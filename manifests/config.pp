# === Class: nexus::config
#
# This class is called from nexus for configuration.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::config {

  $custom_path  = $::nexus::custom_path
  $install_path = $::nexus::install_path
  $user         = $::nexus::user

  group { $user:
    ensure => 'present',
  }

  user { $user:
    ensure => 'present',
    system => true,
  }

  file { [
    $install_path,
    "${custom_path}/sonatype-work"
    ]:
    ensure  => directory,
    owner   => $user,
    group   => $user,
    recurse => true,
  }

  file { "${custom_path}/nexus":
    ensure => 'link',
    target => "${custom_path}/${install_path}",
  }

  file_line { 'nexus_service_user':
    path  => "${custom_path}/nexus/bin/nexus.rc",
    line  => "run_as_user=\"${user}\"",
    match => '^#run_as_user=""',
  }

}
