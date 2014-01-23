adding
addSkip: aTestCase
	super addSkip: aTestCase.
	self
		print: ''
		short: ' [SKIP]' 
		on: self stderr blue 