# === Class: nexus::params
#
# This class is called from nexus for parameters.
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus::params {

  $version      = '3.12.0-01'
  $custom_path  = '/opt'
  $dir_name     = "nexus-${version}"
  $download_url = "https://download.sonatype.com/nexus/3/nexus-${version}-unix.tar.gz"
  $install_path = "${custom_path}/${dir_name}"
  $md5_hash     = '3fa82f46c53459f6545a6dd6f213d92b'
  $java_major   = '8u172'
  $java_minor   = 'b11'
  $java_se      = 'jre'
  $user         = 'nexus'

}
