tests
testLoadNil

	self should: [ self newInstance validate: nil ] raise: Error, AssertionFailure.
	self should: [ self newInstance validate ] raise: Error, AssertionFailure.