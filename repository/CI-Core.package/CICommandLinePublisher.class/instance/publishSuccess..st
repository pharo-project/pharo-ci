publishing
publishSuccess: aCIValidationResult 

	VTermOutputDriver stderr green: (aCIValidationResult change name asString, ' >> test success report');lf.
	self publishWarnings: aCIValidationResult .