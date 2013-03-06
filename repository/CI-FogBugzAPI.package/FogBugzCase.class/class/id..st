instance creation
id: id

	^ self issues
		detect: [:e | e id == id ]
		ifNone: [ self new
					id: id;
					yourself ]