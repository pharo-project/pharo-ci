publishing
publishSuccess: aCIValidationResult 

	VTermOutputDriver stderr 
		green: 'Validation Success: ';
		green: aCIValidationResult change asString; lf.
	
	self publishWarnings: aCIValidationResult.