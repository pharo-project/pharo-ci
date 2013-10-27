accessing
updateFileName: aCIValidationResult
	fileName ifNil: [ 
		fileName := aCIValidationResult change id asString ]