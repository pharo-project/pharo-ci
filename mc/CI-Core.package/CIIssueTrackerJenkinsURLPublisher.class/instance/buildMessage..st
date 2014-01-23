publishing
buildMessage: aCIValidationResult
	^ String streamContents: [ :stream | 
		
		aCIValidationResult isSuccess
			ifTrue: [ stream << 'Issue Validation Succeeded: ' ]
			ifFalse: [ stream << 'Issue Validation Failed: ' ].
			
		stream << self reportUrl; lf.
		
		aCIValidationResult errors ifNotEmpty: [ :errors |
			stream << 'Errors: '; print: errors size; << ' | ' ].
		
		aCIValidationResult warnings ifNotEmpty: [ :warnings |
			stream << 'Warnings: '; print: warnings size; << ' | ' ].
		
		aCIValidationResult messages ifNotEmpty: [ :messages |
			stream << 'Messages: '; print: messages size ]]