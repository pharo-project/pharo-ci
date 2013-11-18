tests
testIsLoadable
	self inform: 'Loading ', self change asString.
	[ 
		self change
			assertLoadable;
			load.
	] on: MCMergeResolutionRequest, Error, Warning do: [ :error |
			self addError: error freeze ]