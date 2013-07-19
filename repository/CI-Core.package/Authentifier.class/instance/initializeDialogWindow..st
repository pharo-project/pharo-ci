initialization
initializeDialogWindow: aWindow

	aWindow okAction: [ | user password |
		user := userField getText.
		password := passwordField getText.
		(user isEmpty or: [ password isEmpty ])
			ifFalse: [ result contents: (user -> password) ]].
		
	aWindow toolbar okButton 		
					keyStrokeForNextFocus: Character tab asKeyCombination;
					keyStrokeForPreviousFocus: Character tab shift asKeyCombination.
		
	aWindow toolbar cancelButton 		
					keyStrokeForNextFocus: Character tab asKeyCombination;
					keyStrokeForPreviousFocus: Character tab shift asKeyCombination.
		
	self focusOrder
		add: userField;
		add: passwordField;
		add: aWindow toolbar.