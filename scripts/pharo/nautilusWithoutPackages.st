"Load Nautilus"
Gofer new
	url: 'http://ss3.gemstone.com/ss/Nautilus';
	package: 'ConfigurationOfNautilusWithoutPackages';
	load.
	
(Smalltalk at: #ConfigurationOfNautilusWithoutPackages) perform: #loadDefault