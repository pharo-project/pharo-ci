publishing
publishWarnings: aCIValidationResult 

	VTermOutputDriver stderr color256: Color orange; <<(aCIValidationResult change name asString, ' >> test success report') asString; flush; clear; lf.
	aCIValidationResult warnings do: [ :aWarnings |
		VTermOutputDriver stderr color256: Color orange; <<aWarnings asString; flush; clear; lf.]