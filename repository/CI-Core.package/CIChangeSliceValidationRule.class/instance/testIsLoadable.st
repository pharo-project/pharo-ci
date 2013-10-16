tests
testIsLoadable.
	self flag: 'The error handling needs to be improved here'.
	self inform: 'Loading ', self change asString.
	[[[ 
		self change
			assertLoadable;
			load.
	] on: MCMergeResolutionRequest do: [ :request |
			self addError: 'Merge conflict occured while loading slice'  ]]
		on: ChangeNotFound do: [ :error |
			self addError: 'No loadable SLICE found.' ]]
		on: Error, Warning do: [ :error |
			self addError: 'Error occurred while loading slice: ', error asString ]