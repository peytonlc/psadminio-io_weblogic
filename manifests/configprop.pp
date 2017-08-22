class io_weblogic::psserver_shuf (
  $pia_domain_list = $io_weblogic::params::pia_domain_list,
  $configprop      = $io_weblogic::params::config_prop,
  $psserver_list   = $io_weblogic::params::psserver_list,
){

  $pia_domain_list.each |$domain_name, $pia_domain_info| {
    $ps_cfg_home_dir = $pia_domain_info['ps_cfg_home_dir']
    $site_list       = $pia_domain_info['site_list']

    $site_list.each |$site_name, $site_info| {

      $config   = "${ps_cfg_home_dir}/webserv/${domain_name}/applications/peoplesoft/PORTAL.war/WEB-INF/psftdocs/${site_name}/configuration.properties"
			$defaults = { 
        'path'    => "${config}",
        'section' => '',
      }

      create_ini_settings($configprop,  $defaults)
    }
  }
}
