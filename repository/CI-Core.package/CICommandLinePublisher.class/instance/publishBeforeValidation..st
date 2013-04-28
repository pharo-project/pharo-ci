publishing
publishBeforeValidation: aCIChange
	VTermOutputDriver stderr 
		yellow: 'Starting validation of ', aCIChange asString; 
		flush; clear; lf.