publishing
xmlBeginning: aCIValidationResult
	self xmlWriter writeWith: [  :writer |
		writer 
			enablePrettyPrinting ;
			xml;
			comment: 'Pharo CI report';
			tag: 'name' with: aCIValidationResult change name, ' - report']
