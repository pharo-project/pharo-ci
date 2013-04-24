publishing
publishWarnings: aCIValidationResult 

	VTermOutputDriver stderr color256: Color orange; <<(aCIValidationResult change name asString, ' >> warning report :') asString; flush; clear; lf.
	aCIValidationResult warnings do: [ :aWarnings |
		VTermOutputDriver stderr color256: Color orange; <<aWarnings asString; flush; clear; lf.]