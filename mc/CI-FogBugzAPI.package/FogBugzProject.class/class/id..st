instance creation
id: id

	^ self projects 
		detect: [ :e | e id = id ] 
		ifNone: [ | instance |
			instance := super new
							id: id;
							yourself.
			self projects add: instance.
			instance ]