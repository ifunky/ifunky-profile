# Web application class
#
# @author Dan
class profile::windows::web::app1 {

  class { 'windows::web::config':
    site_def_name  => 'egi'
  }
}
