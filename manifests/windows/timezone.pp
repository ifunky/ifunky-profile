
class profile::windows::timezone(
  $timezone = hiera('base::params::timezone',$base::params::timezone)
)
{
  include base

  # WINNT  CLASS HAS BEEN REMOVED FROM THE FORGE
  /*class {'winntp':
    special_poll_interval    => 1800,
    ntp_server               => '0.uk.pool.ntp.org, time.windows.com',
    max_pos_phase_correction => 54000,
    max_neg_phase_correction => 54000,
  }
  */

  registry_key { 'HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation':
    ensure => present,
  }

  registry::value { 'timezonekeyname':
    key   => 'HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation',
    value => TimeZoneKeyName,
    type  => string,
    data  => $timezone,
    require => [ Registry_key['HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation'] ],
    notify => Exec['set_timezone'],
  }

  exec {'set_timezone':
    path => 'C:\\Windows\System32',
    command => "tzutil.exe /s \"$timezone\"",
    refreshonly => true,
  }

}