testing
testChangeImpact: aBlock
	|complete|
	
	complete := Semaphore new.
	[ self issue monkeyIsChecking.
	 complete signal ] fork.
	
	" I run tests a first time to be able to remove false errors later"
	self preRunTests.
	[
		loadStopwatch reset activate.
		"here I load the code"
		aBlock value.
		loadStopwatch suspend.

		"Then I re run tests"
		testResult := self runTests.
		self removeFalseErrors.
		
	"collect possible errors"
	] on: Error do: [ :e| self addError: e ].
	
	complete wait.
	self notifyTracker.