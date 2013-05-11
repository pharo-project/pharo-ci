accessing
newInstance
	^ self ruleClass block: [ :change | 
		change loadBlock 
			ifNotNil: [ :block | block value ]
			ifNil: [ CIValidationResult new ]]