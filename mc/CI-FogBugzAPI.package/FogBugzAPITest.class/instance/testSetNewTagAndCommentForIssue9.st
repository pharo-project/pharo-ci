tests identifying
testSetNewTagAndCommentForIssue9
	| client issues |
	self skip: 'Causes too much noise'.
	client := FogBugzTracker pharo logOnWithEmail: self user password: self password.
	issues := client editIssue: 9 withArguments: (Dictionary new
														at: 'sEvent' put: 'Communicating from Pharo';
														at: 'sTags' put: 'PharoIsCOOOOOL';
														at: 'sStatus' put: 'WorkNeeded';
														yourself).