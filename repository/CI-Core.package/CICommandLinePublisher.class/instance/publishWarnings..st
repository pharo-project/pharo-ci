publishing
publishWarnings: aCIValidationResult 
	aCIValidationResult hasWarnings
		ifFalse: [ ^ self ].
	self 
		publishList: aCIValidationResult warnings
		title: 'Validation Warnings'
		color: Color orange.