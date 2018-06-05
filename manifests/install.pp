# === Class: nexus::install
#
# This class is called from nexus for install.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::install {

  $custom_path  = $::nexus::custom_path
  $download_url = $::nexus::download_url
  $install_path = $::nexus::install_path
  $java_major   = $::nexus::java_major
  $java_minor   = $::nexus::java_minor
  $java_se      = $::nexus::java_se
  $md5_hash     = $::nexus::md5_hash

  include ::archive
  include ::java

  java::oracle { "${java_se}8":
    ensure        => 'present',
    version_major => $java_major,
    version_minor => $java_minor,
    java_se       => $java_se,
  }

  archive { $install_path:
    ensure        => present,
    extract       => true,
    extract_path  => $custom_path,
    source        => $download_url,
    checksum      => $md5_hash,
    checksum_type => 'md5',
    creates       => $install_path,
    cleanup       => true,
  }

}
