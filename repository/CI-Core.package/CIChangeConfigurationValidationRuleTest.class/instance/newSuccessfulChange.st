accessing
newSuccessfulChange
	| source |
	
	[Gofer new
	smalltalkhubUser: 'Pharo' project: 'Example';
	version: 'ConfigurationOfPharoExample-ErwanDouaille.4';
	load. ]valueWithin: 40 seconds onTimeout: [ ^ CITestChange loadBlock: [ Error signal ] ].

	 source := CIConfigurationSource new
		metacelloProject: (ConfigurationOfPharoExample project).
	
	^ source changeWithId: #stable