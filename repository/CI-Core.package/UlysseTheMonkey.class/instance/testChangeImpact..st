testing
testChangeImpact: doChangeBlock
	| complete |
	
	"run the issue update requests in the background to save some time"
	complete := Semaphore new.
	[
		self isVerbose ifTrue: [ self issue monkeyIsChecking ].
		complete signal
	] fork.
	
	[
		loadStopwatch reset activate.
		" load the code"
		doChangeBlock value.
		loadStopwatch suspend.

		"Then run the tests"
		testResult := self runAllTests.		
	"collect possible errors"
	] on: Error do: [ :e| self addError: e ].
	
	"wait for the initial issue update to be completed"
	complete wait.
	"update the issue with load/test results"
	self notifyTracker.