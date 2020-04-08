node /-standalone/ {
  include epics::carepeater
}

node /-simpleioc/ {
  file { '/usr/local/lib/iocapps/myioc1':
    ensure => directory,
  }

  file { '/usr/local/lib/iocapps/myioc1/iocBoot':
    ensure => directory,
  }

  file { '/usr/local/lib/iocapps/myioc1/iocBoot/one':
    ensure => directory,
  }

  file { '/usr/local/lib/iocapps/myioc1/iocBoot/one/st.cmd':
    ensure  => file,
    content => '#!/usr/bin/softIoc',
    mode    => '0755',
  }

  epics::ioc { 'myioc1':
    ensure                    => 'running',
    enable                    => true,
    run_make                  => false,
    run_make_after_pkg_update => false,
    auto_restart_ioc          => false,
    bootdir                   => 'iocBoot/one',
    console_port              => 4051,
    require                   => File['/usr/local/lib/iocapps/myioc1/iocBoot/one/st.cmd'],
  }

  file { '/usr/local/lib/iocapps/myioc2':
    ensure => directory,
  }

  file { '/usr/local/lib/iocapps/myioc2/iocBoot':
    ensure => directory,
  }

  file { '/usr/local/lib/iocapps/myioc2/iocBoot/two':
    ensure => directory,
  }

  file { '/usr/local/lib/iocapps/myioc2/iocBoot/two/st.cmd':
    ensure  => file,
    content => '#!/usr/bin/softIoc',
    mode    => '0755',
  }

  epics::ioc { 'myioc2':
    ensure                    => 'running',
    enable                    => true,
    run_make                  => false,
    run_make_after_pkg_update => false,
    auto_restart_ioc          => false,
    bootdir                   => 'iocBoot/two',
    console_port              => 4052,
    require                   => File['/usr/local/lib/iocapps/myioc2/iocBoot/two/st.cmd'],
  }
}

node /-customioc/ {
  class { 'epics::carepeater':
    port => 5077,
  }

  class { 'epics':
    iocbase => '/iocs',
  }

  file { '/iocs/myioc1':
    ensure => directory,
  }

  file { '/iocs/myioc1/iocBoot':
    ensure => directory,
  }

  file { '/iocs/myioc1/iocBoot/one':
    ensure => directory,
  }

  file { '/iocs/myioc1/iocBoot/one/st.cmd':
    ensure  => file,
    content => '#!/usr/bin/softIoc',
    mode    => '0755',
  }

  epics::ioc { 'myioc1':
    ensure                    => 'running',
    enable                    => true,
    run_make                  => false,
    run_make_after_pkg_update => false,
    auto_restart_ioc          => false,
    bootdir                   => 'iocBoot/one',
    console_port              => 4051,
    require                   => File['/iocs/myioc1/iocBoot/one/st.cmd'],
  }

  file { '/iocs/myioc2':
    ensure => directory,
  }

  file { '/iocs/myioc2/iocBoot':
    ensure => directory,
  }

  file { '/iocs/myioc2/iocBoot/two':
    ensure => directory,
  }

  file { '/iocs/myioc2/iocBoot/two/st.cmd':
    ensure  => file,
    content => '#!/usr/bin/softIoc',
    mode    => '0755',
  }

  epics::ioc { 'myioc2':
    ensure                    => 'running',
    enable                    => true,
    run_make                  => false,
    run_make_after_pkg_update => false,
    auto_restart_ioc          => false,
    bootdir                   => 'iocBoot/two',
    console_port              => 4052,
    require                   => File['/iocs/myioc2/iocBoot/two/st.cmd'],
  }
}
