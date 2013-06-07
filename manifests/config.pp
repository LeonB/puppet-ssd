class ssd::config {

  # http://blog.vanutsteen.nl/2012/12/30/upgraded-to-an-ssd/

    file { '/etc/sudoers.d/ssd':
        source  => 'puppet:///modules/ssd/sudoers.d/ssd',
        owner   => root,
        group   => root,
        mode    => '0600',
        require => Class['ssd::package'],
        notify  => Class['ssd::service'],
    }

    sysctl::value { 'vm.swappiness': value => '0'}
}
