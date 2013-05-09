accessing
newInstance
	^ self ruleClass selectTestCaseBlock: [ :aClass | aClass package name beginsWith: 'KernelTests-Numbers' ]