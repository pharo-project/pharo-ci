instance creation
id: id username: username mail: mail
	| user |
	
	user := self users 
				detect: [ :each | each id = id ] 
				ifNone: [ | newUser |
					newUser := super new 
									id: id;
									yourself.
					self users add: newUser.
					newUser ].

	^ user	
		mail: mail;
		username: username;
		yourself