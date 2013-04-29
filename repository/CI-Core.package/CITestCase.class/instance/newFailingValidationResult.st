accessing
newFailingValidationResult
	| result |
	result := self newValidationResult.
	result
		addFailure: 'failure 1';
		addFailure: 'failure 2';
		addFailure: 'failure 3'.
	^ result