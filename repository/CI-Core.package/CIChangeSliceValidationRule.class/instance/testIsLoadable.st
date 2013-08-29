tests
testIsLoadable
	self change assertLoadable.
	self inform: 'Loading ', self change asString.
	[[ self change slice merge ] 
		on: MCMergeResolutionRequest do: [ :request |
			self addError: 'Merge conflict occured while loading slice'  ]]
		on: Error, Warning do: [ :warning |
			self addError: 'Warning occurred while loading slice: ', warning asString ]