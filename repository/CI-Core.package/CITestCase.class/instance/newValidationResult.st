accessing
newValidationResult
	| result |
	result := CIValidationResult new.
	result 
		addMessage: 'message 1';
		addMessage: 'message 2';
		addMessage: 'message 3';
		addWarning: 'warning 1';
		addWarning: 'warning 2';
		addWarning: 'warning 3'.
	^ result