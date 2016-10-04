# Web application class
#
# @author Dan
class profile::windows::web::app1 {

  windowsfeature { [ 'NET-WCF-HTTP-Activation45' ]:
    ensure  => present,
  }

  class { 'windows::web::config':
    site_def_name  => 'egi'
  }
}
