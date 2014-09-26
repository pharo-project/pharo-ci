initialization
initializeWidgets 
	self instantiateModels: #(
		messageLabel		LabelModel
		logText			TextModel).
					
	self messageLabel label: 'Error: ', self error messageText.
	self logText 
		enabled: false;
		text: (self error systemLog ifNil: [ '(No log)' ])