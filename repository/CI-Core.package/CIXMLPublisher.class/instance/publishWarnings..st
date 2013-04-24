publishing
publishWarnings: aCIValidationResult 
	| aString |
	aString := '<failure>'.
	aCIValidationResult warnings do: [ :aWarning |
		aString := aString, '<result>', aWarning asString, '</result>'. ].
	^ aString, '</failure>'.
	