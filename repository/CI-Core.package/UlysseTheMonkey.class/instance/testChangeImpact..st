testing
testChangeImpact: aBlock
	| complete |
	
	"run the issue update requests in the background to save some time"
	complete := Semaphore new.
	[
		self isVerbose ifTrue: [ self issue monkeyIsChecking ].
		complete signal
	] fork.
				
	self preRunTests.
	[
		loadStopwatch reset activate.
		"here I load the code"
		aBlock value.
		loadStopwatch suspend.

		"Then I re run tests"
		testResult := self runAllTests.
		self removeFalseErrors.
		
	"collect possible errors"
	] on: Error do: [ :e| self addError: e ].
	
	"wait for the initial issue update to be completed"
	complete wait.
	"update the issue with load/test results"
	self notifyTracker.