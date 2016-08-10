class motd {
	file {'/etc/motd':
		ensure  => 'present',
		content => "Hello, welcome to $environment \n",
		owner   => 'root',
		mode	=> '0644',
	}

	notice("Your environment is: $environment \n")
}
