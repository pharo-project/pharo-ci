file creation
publishValidationResult: aCIValidationResult

	self updateFileName: aCIValidationResult.
	
	self stream: (self outputDirectory / self fileName, 'html') writeStream.
	self htmlBeginning: aCIValidationResult.
	
	(aCIValidationResult isSuccess )
			ifTrue: [self publishSuccess: aCIValidationResult]
			ifFalse: [ self publishFailures: aCIValidationResult].
	
	(aCIValidationResult warnings isNil or: aCIValidationResult warnings isEmpty ) 
		ifFalse: [self publishWarnings: aCIValidationResult]	.
	(aCIValidationResult messages isNil or: [ aCIValidationResult messages isEmpty ])
		ifFalse: [ self publishMessages: aCIValidationResult ].
		
	self htmlEnding: aCIValidationResult.
	self stream close.