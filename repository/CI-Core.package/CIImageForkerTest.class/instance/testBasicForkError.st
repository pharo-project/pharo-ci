tests
testBasicForkError
	self should: [ NotFound signal ] valueInForkedImage raise: NotFound