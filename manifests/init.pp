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

  String $custom_path  = $::nexus::params::custom_path,
  String $dir_name     = $::nexus::params::dir_name,
  String $file_name    = $::nexus::params::file_name,
  String $install_path = $::nexus::params::install_path,
  String $md5_hash     = $::nexus::params::md5_hash,
  String $user         = $::nexus::params::user,
  String $version      = $::nexus::params::version

) inherits nexus::params {

  contain nexus::install
  contain nexus::config
  contain nexus::service

  Class['::nexus::install']
    -> Class['::nexus::config']
    ~> Class['::nexus::service']
}
