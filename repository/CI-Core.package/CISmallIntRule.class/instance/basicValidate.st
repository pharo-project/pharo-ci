validation
basicValidate

	self testResult: self runRules.
	^ self validationResult.