file creation
publishValidationResult: aCIValidationResult
	| file |
	
	self updateFileName: aCIValidationResult.
	
	file := self outputDirectory / self fileName, 'xml'.
	file ensureDelete.
	self stream: file writeStream.
	self xmlWriter stream: self stream.
	self xmlBeginning: aCIValidationResult.
	self xmlWriter
		writeWith: [ :writer | 
			writer
				tag: 'report'
				with: [ 
					writer tag: 'name' with: aCIValidationResult change name, ' - report'.
					aCIValidationResult isSuccess
						ifTrue: [ self publishSuccess: aCIValidationResult ]
						ifFalse: [ self publishFailures: aCIValidationResult ].
					(aCIValidationResult warnings isNil or: aCIValidationResult warnings isEmpty)
						ifFalse: [ self publishWarnings: aCIValidationResult ].
					(aCIValidationResult messages isNil or: [ aCIValidationResult messages isEmpty ])
						ifFalse: [ self publishMessages: aCIValidationResult ] ] ].
	self xmlWriter close