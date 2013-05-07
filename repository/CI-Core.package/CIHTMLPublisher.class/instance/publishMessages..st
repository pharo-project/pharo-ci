publishing
publishMessages: aCIValidationResult 
	| aString |
	aString := '<h1>', aCIValidationResult change name asString, ' messages : </h1><ul>'.
	aCIValidationResult messages do: [ :aMessage |
		aString := aString, '<li>', aMessage asString, '</li>'. ].
	self stream nextPutAll: aString, '</ul>'.
	