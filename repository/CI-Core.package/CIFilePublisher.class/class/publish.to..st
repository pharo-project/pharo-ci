publishing
publish: aCIValidationResult to: aFileName
	^ self new
		fileName: aFileName;
		publishValidationResult: aCIValidationResult;
		yourself