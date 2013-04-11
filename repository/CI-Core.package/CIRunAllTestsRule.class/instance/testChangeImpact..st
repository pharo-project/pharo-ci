tests
testChangeImpact: aBlock
	self preRunTests.
	[ 
	loadStopwatch reset activate.	"here I load the code"
	aBlock value.
	loadStopwatch suspend.	"Then I re run tests"
	testResult := self runAllTests.
	self removeFalseErrors	"collect possible errors" ]
		on: Error
		do: [ :e | self addError: e ].
	^ self buildValidationResult