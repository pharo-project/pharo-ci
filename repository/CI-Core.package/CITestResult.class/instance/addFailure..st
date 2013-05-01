adding
addFailure: aTestFailure
	super addFailure: aTestFailure.
	self
		print: aTestFailure printString 
		short: ' [FAIL]' 
		on: self stderr red 