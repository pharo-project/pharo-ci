accessing
newWarningChange
	| source |
	
	[Gofer new
	smalltalkhubUser: 'Pharo' project: 'Example';
	version: 'ConfigurationOfPharoExample-ErwanDouaille.1';
	load. ]valueWithin: 40 seconds onTimeout: [ ^ CITestChange loadBlock: [ Error signal ] ].
	
	source := CIConfigurationChangeProvider new
		metacelloProject: (ConfigurationOfPharoExample project).
	
	^ source changeWithId: #stable