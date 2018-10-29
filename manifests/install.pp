# === Class: nexus::install
#
# This class is called from nexus for installation.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::install {
  java::oracle { "${nexus::java_major}-${nexus::java_minor}":
    ensure        => 'present',
    version_major => $nexus::java_major,
    version_minor => $nexus::java_minor,
    java_se       => $nexus::java_se,
    url_hash      => $nexus::java_url_hash,
  }

  archive { $nexus::install_path:
    ensure        => present,
    extract       => true,
    extract_path  => $nexus::install_path,
    source        => "${nexus::nexus_url}nexus-${nexus::version}-unix.tar.gz",
    checksum      => $nexus::hash,
    checksum_type => $nexus::hash_type,
    creates       => "${nexus::install_path}/nexus-${nexus::version}",
    cleanup       => true,
    user          => $nexus::user,
    group         => $nexus::user,
  }
}
