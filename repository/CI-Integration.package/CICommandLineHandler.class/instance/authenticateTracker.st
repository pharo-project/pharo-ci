authentification
authenticateTracker

	self user 
		ifNil: [ ^ self exitFailure: 'no valid user provided for authentification, please set the PHARO_CI_USER  environment variable' ].
	self password 
		ifNil: [ ^ self exitFailure: 'no valid password provided for authentification, please set the PHARO_CI_PWD environment variable' ].
	
	self manager 
		logOnWithEmail: self user
		password: self password.
	
	self manager isAuthenticated
		ifTrue: [ self stderr green: 'issue tracker authentification succeded'; lf ]
		ifFalse: [ self exitFailure: 'issue tracker authentification failed' ].