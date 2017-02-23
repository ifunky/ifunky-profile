# Installs WinLogBeat (https://www.elastic.co/products/beats/winlogbeat)
#
# @author Dan
class profile::windows::software::winlogbeat (
  $proxy_server         = hiera('base::proxy_server',''),
  $elasticsearch_server = hiera('base::elasticsearch_server'),
)
{

  class { 'winlogbeat':
    outputs => {
      'elasticsearch' => {
        'hosts'       => [ $elasticsearch_server],
        'index'       => 'winlogbeat',
      },
    },
  }
}
