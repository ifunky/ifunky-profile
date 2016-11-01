class distributionservices {

  windowsfeature { 'MSMQ':
    ensure  => present,
  }


}