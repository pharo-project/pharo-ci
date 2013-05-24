tests
testBasicForkError

	self flag: 'Problem found in DateAndTime fuel extension serializeOn: '.
	self flag: 'replace 
		encodeInt24: self secondsSinceMidnight;
		to 
		encodeInt24: self secondsSinceMidnightUTC;'.
	self should: [ NotFound signal ] valueInForkedImage raise: NotFound