instance creation
id: id 
	1halt.
	^ self issues
		detect: [:e | e id == id ]
		ifNone: [ self new
					id: id;
					yourself ]