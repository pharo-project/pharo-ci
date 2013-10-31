publishing
publishValidationResult: aCIValidationResult

	self
		updateFileName: aCIValidationResult;
		newStream;
		htmlBeginning: aCIValidationResult.
	
	aCIValidationResult isSuccess
			ifTrue:  [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	
	self publishChanges: aCIValidationResult change.
	
	aCIValidationResult hasWarnings 
		ifTrue: [ self publishWarnings: aCIValidationResult ].
	aCIValidationResult hasMessages
		ifTrue: [ self publishMessages: aCIValidationResult ].
		
	self htmlEnding: aCIValidationResult.
	self stream close.