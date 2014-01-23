adding
addError: aTestFailure
	super addError: aTestFailure.
	self
		print: aTestFailure printString 
		short: ' [FAIL]' 
		on: self stderr red 