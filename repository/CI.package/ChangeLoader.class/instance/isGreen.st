testing
isGreen

	^ testResult failures isEmpty and: [ testResult errors isEmpty and: [ errors isEmpty ]]