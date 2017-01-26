# Installs Chrome using Chocolatey
#
# @author Dan
class profile::windows::software::chrome (
  $version = '55.0.2883.87'
)
{

  package { 'googlechrome':
    ensure          => $version,
    provider        => 'chocolatey',
  }
}
