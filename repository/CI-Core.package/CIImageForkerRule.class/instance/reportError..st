as yet unclassified
reportError: error
	[FLSerializer serialize: error freeze toFileNamed: 'MaterializationError.fuel'] 
			on: Error do: [ :e | 
				self inform: 'A: Could not serialize materialization error: ', e asString ].   
	self inform: 'A: result loading failed'.
	^ CIValidationResult failure: (String streamContents: [ :stream|
		stream << 'Could not parse result from forked image: '; print: error.
		error signalerContext shortDebugStackOn: stream ]).