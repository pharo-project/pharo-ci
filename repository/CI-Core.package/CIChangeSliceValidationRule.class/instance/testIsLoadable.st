tests
testIsLoadable
	self change assertLoadable.
	[[ self change slice merge ] 
		on: MCMergeResolutionRequest do: [ :request |
			self addError: 'Merge conflict occured while loading slice'  ]]
		on: Warning do: [ :warning |
			self addError: 'Warning occurred while loading slice: ', warning asString ]