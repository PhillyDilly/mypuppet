class users {
	group {'dba':
		ensure  => 'present',
		name    => 'dba',
		#gid     => '30',
		before  => User['ndevlin'],
	}

	user {'ndevlin':
		ensure   => 'present',
		name     => 'ndevlin',
		groups   => ['dba','wheel'],
		shell    => '/bin/bash',
		comment  => 'Test DBA Account',
		home	 => '/home/ndevlin',
		password => '!!',
		managehome => 'true',
		require  => Group['dba'],
	}
}
