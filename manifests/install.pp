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
  $dir_name     = $::nexus::dir_name
  $file_name    = $::nexus::file_name
  $install_path = $::nexus::install_path
  $md5_hash     = $::nexus::md5_hash
  $version      = $::nexus::version

  if $version == 'latest' {
    $download_url = 'https://download.sonatype.com/nexus/3/latest-unix.tar.gz'
  }
  else {
    $download_url = "https://download.sonatype.com/nexus/3/nexus-${version}-unix.tar.gz"
  }

  archive { $file_name:
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
