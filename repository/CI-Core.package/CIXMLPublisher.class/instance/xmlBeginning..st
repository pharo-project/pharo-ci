publishing
xmlBeginning: aCIValidationResult
	self xmlWriter writeWith: [  :writer |
		writer 
			enablePrettyPrinting ;
			xml;
			comment: 'Pharo CI report']
