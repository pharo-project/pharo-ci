test-report
validationResult: aCIValidationResult
	errors := aCIValidationResult failures.
	warnings := aCIValidationResult warnings.
	messages := aCIValidationResult messages.
	^ self validationResult