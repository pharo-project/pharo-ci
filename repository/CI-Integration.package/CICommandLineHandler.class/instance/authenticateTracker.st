setup
authenticateTracker
	self googleCodeUser ifNotNil: [
		tracker authenticate: self googleCodeUser with: self googleCodePassword.
		tracker isAuthenticated
			ifTrue: [ self stderr green: 'issue tracker authentification succeded'  ]
			ifFalse: [ self stderr red: 'issue tracker authentification failed' ]]