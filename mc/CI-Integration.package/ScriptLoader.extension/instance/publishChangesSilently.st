*CI-Integration
publishChangesSilently
	| username password str strings|
	
	(FileStream isAFileNamed: 'PharoPass.txt') 
		ifTrue: [ str := FileStream fileNamed:  'PharoPass.txt'. 
				strings := str contents substrings.
				username := strings first.
				password := strings second] 
		ifFalse: [ username := UIManager default request: 'Pharo repository login'.
			     password := UIManager default requestPassword: 'Pharo repository password'.].

	self 
		publicChangesSilently: (IntegrationManager uniqueInstance issuesToIntegrate collect: #id) 
		user: username 
		password: password