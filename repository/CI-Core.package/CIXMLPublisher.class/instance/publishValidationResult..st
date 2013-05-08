file creation
publishValidationResult: aCIValidationResult
	| file |
	file := self outputDirectory / aCIValidationResult change name asString , 'xml'.
	file ensureDeleted.
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