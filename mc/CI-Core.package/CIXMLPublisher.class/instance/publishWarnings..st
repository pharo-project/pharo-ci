publishing
publishWarnings: aCIValidationResult 
	
	self xmlWriter writeWith: [ :writer |
		writer tag: 'warnings' with: [
			aCIValidationResult warnings do: [ :aMessage |
				writer tag: 'result' with:  aMessage ]]].
	