publishing
publishSuccess: aCIValidationResult 

	VTermOutputDriver stderr green: (aCIValidationResult change name asString, ' >> test success report').
	aCIValidationResult messages do: [ :aMessage |
		VTermOutputDriver stderr red: aMessage asString;lf ]