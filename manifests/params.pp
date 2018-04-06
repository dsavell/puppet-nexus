# === Class: nexus::params
#
# This class is called from nexus for parameters.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::params {

  $version      = '3.10.0-04'
  $custom_path  = '/opt'
  $dir_name     = "nexus-${version}"
  $download_url = "https://download.sonatype.com/nexus/3/nexus-${version}-unix.tar.gz"
  $install_path = "${custom_path}/${dir_name}"
  $md5_hash     = '9be12ad6866c4846448c7e666cd5d4e5'
  $user         = 'nexus'

}
