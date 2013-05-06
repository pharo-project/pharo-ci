authentification
authenticateTracker

	self user ifNil: [ ^ self exitFailure: 'no valid user provided for authentification' ].
	self password ifNil: [ ^ self exitFailure: 'no valid password provided for authentification' ].
	
	self manager logOnWithEmail: self user password: self password.
	
	self manager isAuthenticated
		ifTrue: [ self stderr green: 'issue tracker authentification succeded'; lf ]
		ifFalse: [ self exitFailure: 'issue tracker authentification failed' ].