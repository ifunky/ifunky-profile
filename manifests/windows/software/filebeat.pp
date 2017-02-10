# Installs FileBeat (https://www.elastic.co/products/beats/filebeat)
#
# @author Dan
class profile::windows::software::filebeat ()
{

  class { 'filebeat':
    outputs => {
      'elasticsearch' => {
        'hosts' => [
          'http://elasticsearch.logging.pra.rbxd.ds:80/elastic/',
        ],
        'index'       => 'packetbeat',
        'cas'         => [
          '/etc/pki/root/ca.pem',
        ],
      },
    },
  }

  class { 'filebeat::prospector':
    paths    => [
      'D:\RBI Application Logs\EG Exporter\WindowService\*.log',
      'D:\RBI Application Logs\EG Exporter\ConsoleApp\*.log',
    ],
    doc_type => 'log',
  }

}
