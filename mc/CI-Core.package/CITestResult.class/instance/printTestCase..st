printing
printTestCase: aTestCase
	isQuiet ifTrue: [ ^ self ]. 
	self printProgress.
	self stderr print: aTestCase.