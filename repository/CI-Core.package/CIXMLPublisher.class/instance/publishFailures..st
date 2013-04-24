publishing
publishFailures: aCIValidationResult
	| aString |
	aString := '<finality>failure</finality>'.
	aString := aString, '<failure>'.
	aCIValidationResult failures do: [ :aFailure |
		aString := aString, '<result>', aFailure asString, '</result>'. ].
	^ aString, '</failure>'.