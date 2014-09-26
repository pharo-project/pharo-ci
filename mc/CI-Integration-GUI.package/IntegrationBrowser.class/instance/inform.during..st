private
inform: aString during: aBlock 
	self withErrorHandlingDo: [
		UIManager default 
			informUser: aString
			during: aBlock ]