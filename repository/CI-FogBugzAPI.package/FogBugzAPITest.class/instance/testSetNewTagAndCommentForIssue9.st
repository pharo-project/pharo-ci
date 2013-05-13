tests identifying
testSetNewTagAndCommentForIssue9
	| client issues |
	
	client := FogBugzTracker pharo logOnWithEmail: self user password: self password.
	issues := client editIssue: 9 withArguments: (Dictionary new
														at: 'sEvent' put: 'Communicating from Pharo';
														at: 'sTags' put: 'PharoIsCOOOOOL';
														at: 'sStatus' put: 'WorkNeeded';
														yourself).