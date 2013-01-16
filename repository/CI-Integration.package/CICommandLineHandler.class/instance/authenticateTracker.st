setup
authenticateTracker
	self googleCodeUser
		ifNil: [ ^  self stderr red: 'no valid user provided for authentification'; lf ].
		
	tracker authenticate: self googleCodeUser with: self googleCodePassword.
	tracker isAuthenticated
		ifTrue: [ self stderr green: 'issue tracker authentification succeded'; lf ]
		ifFalse: [ self stderr red: 'issue tracker authentification failed'; lf ].