accessing
newInstance
	^ self ruleClass block: [ :change |
		
		[ change load ifNil: [ CIValidationResult new ]] on: Error do: [ :error |
			CIValidationResult error: error ] ]