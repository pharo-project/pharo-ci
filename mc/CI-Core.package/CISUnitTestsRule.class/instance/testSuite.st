validation
testSuite
	| suite |
	suite := TestSuite new.
	TestCase allSubclasses
		select: self defaultSelectTestCaseBlock
		thenDo: [ :testClass | 
			(self selectTestCaseBlock value: testClass)
				ifTrue: [ 
					testClass isAbstract
						ifFalse: [ suite addTests: testClass suite tests ]]].
	^ suite