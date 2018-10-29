# === Class: nexus
#
# This module installs and configures for Sonatype Nexus.
#
# === Parameters
#
# N/A
#
# === Authors
#
# David Savell <https://github.com/dsavell>
#
class nexus (
  String $nexus_url,
  String $hash,
  String $hash_type,
  String $install_path,
  String $java_major,
  String $java_minor,
  String $java_se,
  String $java_url_hash,
  String $user,
  String $version,
) {
  contain nexus::install
  contain nexus::config
  contain nexus::service

  Class['::nexus::install']
    -> Class['::nexus::config']
    ~> Class['::nexus::service']
}
