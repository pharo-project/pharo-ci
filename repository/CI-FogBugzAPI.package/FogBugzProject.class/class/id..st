instance creation
id: id

	^ self projects detect: [ :e | e id = id ] ifNone: [ super new
															id: id;
															yourself ]