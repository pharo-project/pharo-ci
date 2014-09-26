actions
showCloseDialogFor: issues integration: idString
	(self askForCloseIssues: issues) ifFalse: [ ^ self ].
	issues 
		do: [ :each | 
			each
				statusIntegrated;
				saveStatus: 'In ', idString;
				close ]
		displayingProgress: [ :each | each asString ]