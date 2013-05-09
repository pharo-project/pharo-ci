publishing
publishFailure: aCIValidationResult 
	| hasTestFailures change |
	
	change := aCIValidationResult change.
	
	self flag: 'stupid test for now'.
	hasTestFailures := aCIValidationResult errors anySatisfy: [ :failure | 
		failure asString includesSubstring: '>>#test' ].
	
	hasTestFailures
		ifTrue: [ change workNeededFailingTests: aCIValidationResult asString ]
		ifFalse: [ change workNeeded: aCIValidationResult asString ]