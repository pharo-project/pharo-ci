private
withErrorHandlingDo: aBlock 
	aBlock on: Error do: [ :e | e show ]