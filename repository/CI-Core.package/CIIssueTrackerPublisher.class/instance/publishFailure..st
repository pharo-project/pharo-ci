publishing
publishFailure: aCIValidationResult 
	| hasTestFailures change |
	
	change := aCIValidationResult change.
	
	hasTestFailures := aCIValidationResult failures anySatisfy: [ :failure | 
		failure asString includesSubstring: '>>#test' ].
	
	hasTestFailures
		ifTrue: [ change workNeededFailingTests: aCIValidationResult asString ]
		ifFalse: [ change workNeeded: aCIValidationResult asString ]