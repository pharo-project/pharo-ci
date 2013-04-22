as yet unclassified
publishWarnings: aCIValidationResult 
	| aString |
	aString := '<h1>', aCIValidationResult change name asString, ' warnings : </h1><ul>'.
	aCIValidationResult warnings do: [ :aWarning |
		aString := aString, '<li>', aWarning asString, '</li>'. ].
	^ aString, '</ul>'.
	