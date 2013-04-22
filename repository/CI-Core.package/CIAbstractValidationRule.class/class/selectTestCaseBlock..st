instance creation
selectTestCaseBlock: aBlock
	^ self new
		selectTestCaseBlock: aBlock;
		yourself