# === Class: nexus::params
#
# This class is called from nexus for parameters.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::params {

  $custom_path  = '/opt'
  $dir_name     = "nexus-${version}"
  $file_name    = "${dir_name}-unix.tar.gz"
  $install_path = "${custom_path}/${dir_name}"
  $md5_hash     = '9d3a031c09aea27622568533e28383a5'
  $user         = 'nexus'
  $version      = 'latest'

}
