accessing
newFailingValidationResult
	| result |
	result := self newValidationResult.
	result
		addError: 'failure 1';
		addError: 'failure 2';
		addError: 'failure 3'.
	^ result