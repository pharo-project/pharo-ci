initialization
initializeWidgets 

	self instantiateModels: #(
		userLabel 			LabelModel
		userField 			TextInputFieldModel
		gmail 				LabelModel
		passwordLabel 	LabelModel
		passwordField 		TextInputFieldModel ).
				
	userLabel text: 'Username:'.
	userField 
		entryCompletion: nil;
		autoAccept: true;
		ghostText: 'username'.
		
	gmail text: '@gmail.com'.
	passwordLabel text: 'Password:'.
	passwordField
		autoAccept: true; 
		ghostText: 'password';
		entryCompletion: nil;
		beEncrypted.