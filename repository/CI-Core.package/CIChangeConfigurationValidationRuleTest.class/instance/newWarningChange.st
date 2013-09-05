accessing
newWarningChange
	| source |
	
	Gofer new
		smalltalkhubUser: 'Pharo' project: 'Example';
		version: 'ConfigurationOfPharoExample-ErwanDouaille.1';
		load.
	
	source := CIConfigurationChangeProvider new
		metacelloProject: #ConfigurationOfPharoExample asClass project.
	
	^ source changeWithId: #stable