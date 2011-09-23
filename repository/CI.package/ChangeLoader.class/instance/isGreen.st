testing
isGreen
	^  errors isEmpty and: [ testResult failures isEmpty and: [ testResult errors isEmpty ]]