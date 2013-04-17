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
						(impacted sameAs: testClass )
							ifTrue: [ suite add: testClass ]]]].
				self halt.
	^ testResult := suite run.