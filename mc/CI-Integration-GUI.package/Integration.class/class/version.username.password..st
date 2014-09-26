instance creation
version: versionString username: usernameString password: passwordString
	^ self basicNew 
		initializeVersion: versionString 
			username: usernameString 
			password: passwordString;
		yourself