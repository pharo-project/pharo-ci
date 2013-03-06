protocol-users
registerEmail: email
	| fullName indexOfAt indexOfPlus index |
	
	indexOfAt := email indexOf: $@.
	indexOfPlus := email indexOf: $+.
	
	index := 
		indexOfAt isZero 
			ifTrue: [ indexOfPlus ]
			ifFalse: [ indexOfPlus isZero
						ifTrue: [ indexOfAt ]
						ifFalse: [ indexOfAt min: indexOfPlus ]].
	
	fullName := email copyFrom:1 to: index -1.
	
	^ self registerUserNamed: fullName email: email password: 'random'