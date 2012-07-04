initialization
initializeDialogWindow: aWindow

	aWindow okAction: [ | user password |
		user := userField getText.
		password := passwordField getText.
		(user isEmpty or: [ password isEmpty ])
			ifFalse: [ result contents: (user -> password) ]]