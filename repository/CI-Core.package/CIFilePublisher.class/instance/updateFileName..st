accessing
updateFileName: aCIValidationResult
	fileName ifNil: [ 
		fileName := aCIValidationResult change name asString ]