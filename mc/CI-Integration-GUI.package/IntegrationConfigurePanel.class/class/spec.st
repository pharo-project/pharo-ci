accessing
spec 
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :c |
			c 
				"newRow: [ :r | r newColumn: #versionLabel; newColumn: #versionText ];"
				newRow: [ :r | r newColumn: #usernameLabel; newColumn: #usernameText ];
				newRow: [ :r | r newColumn: #passwordLabel; newColumn: #passwordText ];
				newRow: [ :r | r newColumn: #externalBrowserLabel; newColumn: #externalBrowserText ] ]