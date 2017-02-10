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
      },
    },
    logging => {
      'level'     => error,
      'to_files'  => true,
      'to_syslog' => false,
    },

  }

  filebeat::prospector { 'log':
    paths    => [
      'D:\RBILogs\*.log',
    ],
    doc_type => 'log',
    fields   => {"applicationName" => elastic-search-loader}
  }

}
