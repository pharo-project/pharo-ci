file creation
publishValidationResult: aCIValidationResult

	self stream: (self outputDirectory / aCIValidationResult change name asString, 'xml') writeStream.
	self xmlWriter stream: self stream.
	self xmlBeginning: aCIValidationResult .
	(aCIValidationResult isSuccess )
			ifTrue: [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailures: aCIValidationResult ].
			
	(aCIValidationResult warnings isNil or: aCIValidationResult warnings isEmpty ) 
		ifFalse: [self publishWarnings: aCIValidationResult].
	(aCIValidationResult messages isNil or: [ aCIValidationResult messages isEmpty ])
		ifFalse: [ self publishMessages: aCIValidationResult ].
		
	self xmlWriter close.