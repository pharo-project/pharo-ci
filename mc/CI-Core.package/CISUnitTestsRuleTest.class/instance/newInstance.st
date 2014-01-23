accessing
newInstance
	^ self ruleClass selectTestCaseBlock: [ :aClass | 
		aClass category beginsWith: self defaultTestPackage ]