publishing
publishMessages: aCIValidationResult 
	| aString |
	aString := '<message>'.
	aCIValidationResult messages do: [ :aMessage |
		aString := aString, '<result>', aMessage asString, '</result>'. ].
	^ aString, '</message>'.
	