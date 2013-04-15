image forking
publishResult: aCIValidationResult
	self serializer
		serialize: aCIValidationResult 
		on: FileStream stdout binary