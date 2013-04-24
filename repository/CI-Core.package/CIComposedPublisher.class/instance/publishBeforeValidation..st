publishing
publishBeforeValidation: aCIChange
	
	self publishers do: [ :publisher | 
			publisher publishBeforeValidation: aCIChange ].