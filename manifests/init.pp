class ssd(
  $enabled       = params_lookup( 'enabled' )
  ) inherits ssd::params {

    $ensure = $enabled ? {
      true => present,
      false => absent,
    }

  include ssd::package, ssd::config, ssd::service
}
