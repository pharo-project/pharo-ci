as yet unclassified
fileCreation: aCIValidationResult

	self stream: (self outputDirectory / aCIValidationResult change name asString, '.xml') writeStream.
	self stream nextPutAll: (self xmlBeginning: aCIValidationResult) .
	aCIValidationResult	isSuccess 
			ifTrue: [ self stream nextPutAll: (self publishSuccess: aCIValidationResult).
				self stream nextPutAll: (self publishWarnings: aCIValidationResult) ]
			ifFalse: [ self stream nextPutAll: (self publishFailure: aCIValidationResult) ].
	(aCIValidationResult messages isNil or: [ self failures isEmpty ])
		ifTrue: [ self stream nextPutAll: (self publishMessages: aCIValidationResult) ].
	self stream nextPutAll: (self xmlEnding: aCIValidationResult) .
	self stream close.