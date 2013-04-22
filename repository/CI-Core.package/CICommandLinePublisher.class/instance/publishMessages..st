publishing
publishMessages: aCIValidationResult 

	VTermOutputDriver stderr color256: Color orange; <<(aCIValidationResult change name asString, ' >> test success report') asString; flush; clear; lf.
	aCIValidationResult messages do: [ :aMessage |
		VTermOutputDriver stderr color256: Color orange; <<aMessage asString; flush; clear; lf.]