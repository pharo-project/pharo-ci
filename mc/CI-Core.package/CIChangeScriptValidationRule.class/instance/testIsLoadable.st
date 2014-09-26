tests
testIsLoadable

	[ self change 
		assertLoadable;
		load ] on: MCMergeResolutionRequest, Error, Warning, Halt do: [ :error |
			self addError: error freeze ]