publishing
buildMessage: aCIValidationResult
	^ String streamContents: [ :str | 
		aCIValidationResult isSuccess
			ifTrue: [ str nextPutAll: 'Issue Validation Succeeded: ' ]
			ifFalse: [ str nextPutAll: 'Issue Validation Failed: ' ].
		str nextPutAll: self reportUrl ]