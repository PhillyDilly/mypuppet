class sshd {

	package { 'openssh-server':
		ensure  => 'present',
		before  => File['/etc/ssh/sshd_config'],
	}

	file { '/etc/ssh/sshd_config':
		ensure  => 'present',
		owner   => 'root',
		group	=> 'root',
		mode	=> '0600',
		source => 'puppet:///modules/sshd/sshd_config.txt',
		require => Package['openssh-server'],
	}

	service { 'sshd':
		ensure  => 'running',
		enable  => 'true', #
		subscribe => File['/etc/ssh/sshd_config'],
	}
}
