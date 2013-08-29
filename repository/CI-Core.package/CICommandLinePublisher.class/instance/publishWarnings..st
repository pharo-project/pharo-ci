publishing
publishWarnings: aCIValidationResult 

	VTermOutputDriver stderr 
		color256: Color orange; 
		<< (aCIValidationResult change name asString, ' >> warning report :') asString; 
		flush; clear; lf.
		
	aCIValidationResult warnings do: [ :aWarning |
		VTermOutputDriver stderr 
			color256: Color orange; 
			<< aWarning asString; flush; clear; lf ]