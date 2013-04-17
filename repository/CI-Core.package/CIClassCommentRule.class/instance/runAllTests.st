testing
runAllTests
	"here use self impectedClasses"
	|suite|
	
	suite := TestSuite new.
	TestCase allSubclasses 
		select: self selectTestCaseBlock
		thenDo: [ :testClass|
			testClass isAbstract 
				ifFalse: [ 
					self change impactedPackages do:[ :impacted |
						(impacted asString sameAs: testClass asString)
							ifTrue: [ suite add: testClass ]]]].
	^ testResult := suite run.