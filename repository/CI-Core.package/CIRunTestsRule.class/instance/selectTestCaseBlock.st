accessing
selectTestCaseBlock
	^ selectTestCaseBlock ifNil: [ ^ [ :testCase| true ] ]