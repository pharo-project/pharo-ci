instance creation
id: id

	^ self issues 
		detect: [ :e | e id = id ] 
		ifNone: [ | instance |
			instance := super new
							id: id;
							yourself.
			self issues add: instance.
			instance ]