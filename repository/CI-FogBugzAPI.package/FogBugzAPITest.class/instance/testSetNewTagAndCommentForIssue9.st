identifying
testSetNewTagAndCommentForIssue9
	| client issues |
	
	client := FogBugzAPI email: 'test@test.com' password: 'testtest'.
	issues := client editIssue: 9 withArguments: (Dictionary new
														at: 'sEvent' put: 'Communicating from Pharo';
														at: 'sTags' put: 'PharoIsCOOOOOL';
														at: 'sStatus' put: 'WorkNeeded';
														yourself).