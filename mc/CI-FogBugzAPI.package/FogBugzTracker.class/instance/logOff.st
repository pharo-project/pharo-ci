logging
logOff
	self sendRequestWithArguments: {'cmd'->'logoff'} asDictionary.
	identifyingToken := nil