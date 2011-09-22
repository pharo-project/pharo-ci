testing
testChangeImpact: aBlock
	"I run the tests, then evaluate the given BLock then run the tests again. Usually aBlock loads some code which might affect the tests' outcome"
	
	" I run tests a first time to be able to remove false errors later"
	self preRunTests.
	[
		"here I load the code"
		aBlock value.

		"Then I re run tests"
		testResult := self runTests.
		self removeFalseErrors.
		
	"collect possible errors"
	] on: Error do: [ :e| self addError: e ].
	