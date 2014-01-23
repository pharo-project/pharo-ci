publishing
publishFailure: aCIValidationResult message: aMessage
	| hasTestFailures change |
	
	change := aCIValidationResult change.
	
	self flag: 'stupid test for now'.
	hasTestFailures := aCIValidationResult errors anySatisfy: [ :failure | 
		failure asString includesSubstring: '>>#test' ].
	
	hasTestFailures
		ifTrue: [ change workNeededFailingTests: aMessage ]
		ifFalse: [ change workNeeded: aMessage ]