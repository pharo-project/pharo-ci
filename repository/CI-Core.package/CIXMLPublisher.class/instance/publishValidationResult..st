file creation
publishValidationResult: aCIValidationResult

	self stream: (self outputDirectory / aCIValidationResult change name asString, 'xml') writeStream.
	self stream nextPutAll: (self xmlBeginning: aCIValidationResult) .
	aCIValidationResult	isSuccess 
			ifTrue: [ self stream nextPutAll: (self publishSuccess: aCIValidationResult).
				self stream nextPutAll: (self publishWarnings: aCIValidationResult) ]
			ifFalse: [ self stream nextPutAll: (self publishFailures: aCIValidationResult) ].
	(aCIValidationResult messages isNil or: [ aCIValidationResult failures isEmpty ])
		ifTrue: [ self stream nextPutAll: (self publishMessages: aCIValidationResult) ].
	self stream nextPutAll: (self xmlEnding: aCIValidationResult) .
	self stream close.