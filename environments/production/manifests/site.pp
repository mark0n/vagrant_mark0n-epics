node /-standalone/ {
  include epics::carepeater
}

node /-simpleioc/ {
  ['one', 'two'].each |$inst| {
    file { "/usr/local/lib/iocapps/myioc${inst}":
      ensure => directory,
    }

    file { "/usr/local/lib/iocapps/myioc${inst}/iocBoot":
      ensure => directory,
    }

    file { "/usr/local/lib/iocapps/myioc${inst}/iocBoot/${inst}":
      ensure => directory,
    }

    file { "/usr/local/lib/iocapps/myioc${inst}/iocBoot/${inst}/st.cmd":
      ensure  => file,
      content => '#!/usr/bin/softIoc',
      mode    => '0755',
    }
  }

  epics::ioc {
    default:
      ensure                    => 'running',
      enable                    => true,
      run_make                  => false,
      run_make_after_pkg_update => false,
      auto_restart_ioc          => false,;

    'myiocone':
      bootdir                   => 'iocBoot/one',
      console_port              => 4051,
      require                   => File['/usr/local/lib/iocapps/myiocone/iocBoot/one/st.cmd'],;

    'myioctwo':
      bootdir                   => 'iocBoot/two',
      console_port              => 4052,
      require                   => File['/usr/local/lib/iocapps/myioctwo/iocBoot/two/st.cmd'],;
  }
}

node /-customioc/ {
  class { 'epics::carepeater':
    port => 5077,
  }

  class { 'epics':
    iocbase => '/iocs',
  }

  ['one', 'two'].each |$inst| {
    file { "/iocs/myioc${inst}":
      ensure => directory,
    }

    file { "/iocs/myioc${inst}/iocBoot":
      ensure => directory,
    }

    file { "/iocs/myioc${inst}/iocBoot/${inst}":
      ensure => directory,
    }

    file { "/iocs/myioc${inst}/iocBoot/${inst}/st.cmd":
      ensure  => file,
      content => '#!/usr/bin/softIoc',
      mode    => '0755',
    }
  }

  epics::ioc {
    default:
      ensure                    => 'running',
      enable                    => true,
      run_make                  => false,
      run_make_after_pkg_update => false,
      auto_restart_ioc          => false,;

    'myiocone':
      bootdir                   => 'iocBoot/one',
      console_port              => 4051,
      require                   => File['/iocs/myiocone/iocBoot/one/st.cmd'],;

    'myioctwo':
      bootdir                   => 'iocBoot/two',
      console_port              => 4052,
      require                   => File['/iocs/myioctwo/iocBoot/two/st.cmd'],;
  }
}
