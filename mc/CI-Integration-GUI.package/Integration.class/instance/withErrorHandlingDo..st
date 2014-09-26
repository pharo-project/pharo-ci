private
withErrorHandlingDo: aBlock
	aBlock 
		on: Error 
		do: [ :e | 
			IntegrationError new
				messageText: e messageText;
				systemLog: self log;
				signal ] 