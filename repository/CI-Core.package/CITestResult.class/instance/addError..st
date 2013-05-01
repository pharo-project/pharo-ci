adding
addError: aTestFailure
	super addError: aTestFailure.
	self
		print: aTestFailure printString 
		short: ' [ERROR]' 
		on: self stderr red 