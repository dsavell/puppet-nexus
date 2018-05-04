# === Class: nexus::params
#
# This class is called from nexus for parameters.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::params {

  $version      = '3.11.0-01'
  $custom_path  = '/opt'
  $dir_name     = "nexus-${version}"
  $download_url = "https://download.sonatype.com/nexus/3/nexus-${version}-unix.tar.gz"
  $install_path = "${custom_path}/${dir_name}"
  $md5_hash     = '6e15a48263e52291e3041ac755417525'
  $java_major   = '8u171'
  $java_minor   = 'b11'
  $user         = 'nexus'

}
