accessing
newInstance
	^ self ruleClass selectTestCaseBlock: [ :aClass | aClass = ObjectTest ]