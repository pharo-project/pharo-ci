accessing
sendRequestWithArguments: arguments

	arguments at: 'token' put: self identifyingToken.
	^ self class sendRequestWithArguments: arguments