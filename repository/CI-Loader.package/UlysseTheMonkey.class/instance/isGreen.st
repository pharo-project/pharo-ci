testing
isGreen
	^  errors isEmpty and: [ testFailures isEmptyOrNil and: [ testErrors isEmptyOrNil ]]