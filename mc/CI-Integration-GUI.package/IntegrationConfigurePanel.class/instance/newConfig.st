accessing
newConfig
	^ IntegrationConfig new 
		version: IntegrationConfig defaultVersion "self versionText text";
		username: self usernameText text;
		password: self passwordText text;
		externalBrowserCommand: self externalBrowserText text;
		yourself