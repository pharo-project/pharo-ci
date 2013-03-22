setup
authenticateTracker

	self user
		ifNil: [ ^ self exitFailure: 'no valid user provided for authentification' ].
	
	self issueChecker logOnWithEmail: self user password: self password.
	self issueChecker isAuthenticated
		ifTrue: [ self stderr green: 'issue tracker authentification succeded'; lf ]
		ifFalse: [ self exitFailure: 'issue tracker authentification failed' ].