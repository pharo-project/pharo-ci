publishing
publishFailures: aCIValidationResult
	| aString |
	aString := '<h1>', aCIValidationResult change name asString, ' failures : </h1><ul>'.
	aCIValidationResult errors do: [ :aFailure |
		aString := aString, '<li>', aFailure asString, '</li>'. ].
	self stream nextPutAll:  aString, '</ul>'.
	