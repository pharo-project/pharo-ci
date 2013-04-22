as yet unclassified
publishFailures: aCIValidationResult
	| aString |
	aString := '<h1>', aCIValidationResult change name asString, ' failures : </h1><ul>'.
	aCIValidationResult failures do: [ :aFailure |
		'<li>', aFailure asString, '</li>'. ].
	^ aString, '</ul>'.
	