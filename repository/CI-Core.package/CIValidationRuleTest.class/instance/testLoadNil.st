tests
testLoadNil

	self should: [ self newInstance validate: nil ] raise: Error.
	self should: [ self newInstance validate ] raise: Error.