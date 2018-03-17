#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with nexus](#setup)
    * [What nexus affects](#what-nexus-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nexus](#beginning-with-nexus)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This Puppet module installs and manages [Sonatype Nexus Repository OSS](https://www.sonatype.com/nexus-repository-oss).

## Setup

### What nexus affects

* Downloads Nexus Repository OSS.
* Installation of Nexus Repository OSS.
* Nexus Repository OSS configuration.
 - Location of installation.
 - Nexus service user.
* Systemd service.

### Setup Requirements

* Module Requirements:
 - [puppetlabs-stdlib](https://forge.puppet.com/puppetlabs/stdlib)
 - [puppet-archive](https://forge.puppet.com/puppet/archive)

### Beginning with nexus

To install the latest Nexus Repository OSS on your system `include nexus` is enough to get you up and running.

## Usage

All parameters for the nexus module are contained within the main nexus class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable Nexus Repository OSS

```puppet
include nexus
```

### Set version of Nexus Repository OSS
```puppet
class { 'nexus':
  md5_hash => '9d3a031c09aea27622568533e28383a5',
  version  => '3.9.0-01',
}
```

### Change root install path (default /opt)
```Puppet
class { 'nexus':
  custom_path => '/data',
}
```

### Change Nexus service user
```puppet
class { 'nexus':
  user => 'bob',
}
```

## Reference

## Limitations

## Development
