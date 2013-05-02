file creation
publishValidationResult: aCIValidationResult

	self stream: (self outputDirectory / aCIValidationResult change name asString, 'html') writeStream.
	self stream nextPutAll: (self htmlBeginning: aCIValidationResult) .
	
	(aCIValidationResult isSuccess )
			ifTrue: [ 
				self stream nextPutAll: (self publishSuccess: aCIValidationResult).
				(aCIValidationResult messages isNil or: aCIValidationResult messages isEmpty ) 
					ifFalse: [self stream nextPutAll: (self publishWarnings: aCIValidationResult)]]
			ifFalse: [ 
				self stream nextPutAll: (self publishFailures: aCIValidationResult) ].
			
	(aCIValidationResult messages isNil or: [ aCIValidationResult messages isEmpty ])
		ifFalse: [ self stream nextPutAll: (self publishMessages: aCIValidationResult) ].
		
	self stream nextPutAll: (self htmlEnding: aCIValidationResult) .
	self stream close.