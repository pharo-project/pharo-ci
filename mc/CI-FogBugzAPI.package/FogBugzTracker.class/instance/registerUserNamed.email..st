protocol-users
registerUserNamed: fullName email: email

	^ self registerUserNamed: fullName email: email password: 'random'