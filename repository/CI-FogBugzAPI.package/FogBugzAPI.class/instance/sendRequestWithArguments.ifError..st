protocol
sendRequestWithArguments: arguments ifError: aBlock 

	arguments at: 'token' put: self identifyingToken.
	^ self class 
		sendRequestWithArguments: arguments 
		ifError: aBlock