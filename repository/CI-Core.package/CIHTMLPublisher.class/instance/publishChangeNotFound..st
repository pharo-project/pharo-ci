helper
publishChangeNotFound: changeNotFound
	self publishResultGroupWithTitle: 'Could not Find Change' with: [ 
		self stream print: changeNotFound change
	]