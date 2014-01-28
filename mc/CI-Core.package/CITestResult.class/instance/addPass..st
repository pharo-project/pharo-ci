adding
addPass: aTestCase
	super addPass: aTestCase.
	"self
		print: ''
		short: ' [OK]' 
		on: self stderr green "
	self stderr nextPut: $.