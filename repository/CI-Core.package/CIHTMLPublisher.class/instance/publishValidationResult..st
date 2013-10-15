file creation
publishValidationResult: aCIValidationResult

	self updateFileName: aCIValidationResult.
	
	self stream: (self outputDirectory / self fileName, 'html') writeStream.
	self htmlBeginning: aCIValidationResult.
	
	aCIValidationResult isSuccess
			ifTrue: [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailures: aCIValidationResult ].
	
	aCIValidationResult hasWarnings 
		ifTrue: [ self publishWarnings: aCIValidationResult ].
	aCIValidationResult hasMessages
		ifTrue: [ self publishMessages: aCIValidationResult ].
		
	self htmlEnding: aCIValidationResult.
	self stream close.