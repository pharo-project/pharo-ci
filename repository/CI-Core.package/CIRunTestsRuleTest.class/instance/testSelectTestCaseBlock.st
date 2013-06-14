tests
testSelectTestCaseBlock
	| suite suite2 |
	suite := self ruleClass new testSuite.
	self deny: suite tests isEmpty.
	
	suite2 := self newInstance
		selectTestCaseBlock: [ :case | false ];
		testSuite.
	self assert: suite2 tests isEmpty.
	
	suite2 := self ruleClass new
		selectTestCaseBlock: [ :case | true ];
		testSuite.
	self 
		assert: suite tests size 
		equals: suite2 tests size
	