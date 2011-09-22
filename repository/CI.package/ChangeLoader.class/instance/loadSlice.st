protocol
loadSlice

	"Load slice and run tests"
	self issue slice
		ifNotNil: [:slice | 
			
			" I run tests a first time to be able to remove false errors later"
			previousTestResult := self runTests.
			
			"here I load the code"
			slice load.
		
			"Then I re run tests"
			testResult := self runTests.
			self removeFalseErrors.
			
			"Finally I notive Google"
			self isGreen
				ifTrue: [ self issue fixToInclude: self buildReport ]
				ifFalse:[ self issue reviewNeeded:  self buildErrorReport ]]