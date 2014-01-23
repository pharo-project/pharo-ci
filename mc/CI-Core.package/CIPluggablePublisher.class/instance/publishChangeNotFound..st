publishing
publishChangeNotFound: aCIChange
	self changeNotFoundBlock ifNotNil: [ 
		self changeNotFoundBlock cull: aCIChange ]