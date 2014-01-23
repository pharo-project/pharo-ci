publishing
publishSuccess: aCIValidationResult

	^self xmlWriter writeWith: [ :writer | 
		writer tag: 'finality' with: 'succeed'].