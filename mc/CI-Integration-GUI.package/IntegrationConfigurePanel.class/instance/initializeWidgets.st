initialization
initializeWidgets 
	self instantiateModels: #(
		"versionLabel				LabelModel
		versionText					TextInputFieldModel"
		usernameLabel				LabelModel
		usernameText					TextInputFieldModel
		passwordLabel				LabelModel
		passwordText					TextInputFieldModel
		externalBrowserLabel		LabelModel
		externalBrowserText		TextInputFieldModel
	).
	
	"self versionLabel label: 'Image version:'."
	self usernameLabel label: 'Inbox username:'.	
	self passwordLabel label: 'Inbox password:'.	
	self externalBrowserLabel label: 'External Browser:'.	
	
	self usernameText autoAccept: true.
	self passwordText 
		autoAccept: true;
		beEncrypted.
	self externalBrowserText autoAccept: true.
	
	self focusOrder 
		"add: self versionText;"
		add: self usernameText;
		add: self passwordText;
		add: self externalBrowserText
		