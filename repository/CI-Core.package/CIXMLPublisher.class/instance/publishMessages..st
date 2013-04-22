as yet unclassified
publishMessages: aCIValidationResult 
	| aString |
	aString := '<h1>', aCIValidationResult change name asString, ' messages : </h1><ul>'.
	aCIValidationResult messages do: [ :aMessage |
		'<li>', aMessage asString, '</li>'. ].
	^ aString, '</ul>'.
	