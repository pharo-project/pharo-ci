instance creation
issue: aNumber version: versionString
	^ self basicNew  
		initializeIssue: aNumber version: versionString;
		yourself