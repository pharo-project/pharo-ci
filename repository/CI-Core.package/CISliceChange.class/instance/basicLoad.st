protocol
basicLoad	
	[[ self slice merge ] 
		on: MCMergeResolutionRequest do: [ :request |
			Error signal: 'Merge conflict occured while loading slice'  ]]
		on: Warning do: [ :warning |
			Error signal: 'Warning occurred while loading slice: ', warning asString ]