# Installs FileBeat (https://www.elastic.co/products/beats/filebeat)
#
# @author Dan
class profile::windows::software::filebeat (
  $version = '5.2.0'
)
{

  package { 'filebeat':
    ensure          => $version,
    provider        => 'chocolatey',
  }
}
